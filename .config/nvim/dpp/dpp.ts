import {
  BaseConfig,
  ContextBuilder,
  Dpp,
  Plugin,
} from "https://deno.land/x/dpp_vim@v0.0.7/types.ts";
import { Denops, fn } from "https://deno.land/x/dpp_vim@v0.0.5/deps.ts";
type Toml = {
  ftplugins?: Record<string, string>;
  hooks_file?: string;
  multiple_plugins?: Plugin[] & {
    plugins: string[];
  };
  plugins?: Plugin[];
};

const [context, options] = await args.contextBuilder.get(args.denops);

const tomlPlugins = await args.dpp.extAction(
  args.denops,
  context,
  options,
  "toml",
  "load",
  {
    path: "~/.config/nvim/dpp/dpp.toml",
  },
) as Toml;
