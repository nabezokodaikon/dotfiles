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

    tomls.push(
      await args.dpp.extAction(
        args.denops,
        context,
        options,
        "toml",
        "load",
        {
          path: `~/.config/nvim/dpp.toml`,
          options: {
            lazy: false,
          },
        },
      ) as Toml,
    );

    const recordPlugins: Record<string, Plugin> = {};

    tomls.forEach((toml) => {
      for (const plugin of toml.plugins) {
        recordPlugins[plugin.name] = plugin;
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

