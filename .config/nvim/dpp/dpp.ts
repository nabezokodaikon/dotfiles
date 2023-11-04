import {
  BaseConfig,
  ContextBuilder,
  Dpp,
  Plugin,
} from "https://deno.land/x/dpp_vim@v0.0.7/types.ts";
import {
  Denops,
} from "https://deno.land/x/dpp_vim@v0.0.7/deps.ts";

export class Config extends BaseConfig {
  override async config(args: {
    denops: Denops;
    contextBuilder: ContextBuilder;
    basePath: string;
    dpp: Dpp;
  }): Promise<{
    plugins: Plugin[];
    stateLines: string[];
  }> {

    type Toml = {
      hooks_file?: string;
      ftplugins?: Record<string, string>;
      plugins: Plugin[];
    };

    type LazyMakeStateResult = {
      plugins: Plugin[];
      stateLines: string[];
    };

    args.contextBuilder.setGlobal({
      protocols: ["git"],
    });

    const [context, options] = await args.contextBuilder.get(args.denops);

    const tomls: Toml[] = [];

    async function pushToml(tomlFile: string, isLazy: boolean) {
      tomls.push(
        await args.dpp.extAction(
          args.denops,
          context,
          options,
          "toml",
          "load",
          {
            path: `~/.config/nvim/dpp/${tomlFile}`,
            options: {
              lazy: isLazy,
            },
          },
        ) as Toml,
      );
    }

    await pushToml('dpp.toml', false);
    await pushToml('dpplazy.toml', true);
    await pushToml('ddc.toml', true);
    await pushToml('ddu.toml', true);

    const recordPlugins: Record<string, Plugin> = {};
    const ftplugins: Record<string, string> = {};
    const hooksFiles: string[] = [];

    tomls.forEach((toml) => {

      for (const plugin of toml.plugins) {
        recordPlugins[plugin.name] = plugin;
      }

      if (toml.ftplugins) {
        for (const filetype of Object.keys(toml.ftplugins)) {
          if (ftplugins[filetype]) {
            ftplugins[filetype] += `\n${toml.ftplugins[filetype]}`;
          } else {
            ftplugins[filetype] = toml.ftplugins[filetype];
          }
        }
      }

      if (toml.hooks_file) {
        hooksFiles.push(toml.hooks_file);
      }
    });

    const lazyResult = await args.dpp.extAction(
      args.denops,
      context,
      options,
      "lazy",
      "makeState",
      {
        plugins: Object.values(recordPlugins),
      },
    ) as LazyMakeStateResult;

    return {
      plugins: lazyResult.plugins,
      stateLines: lazyResult.stateLines,
    };
  }
}

