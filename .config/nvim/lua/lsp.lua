--------------------------------
-- LSP configurations
--------------------------------
local o = vim.o

-- LSP setting module.
local lsp = require"lspconfig"
local util = require"lspconfig/util"
local completion = require"completion"
local compe = require"compe"


local M = {}

-- Completion setting
--------------------------------
o.completeopt="menuone,noinsert,noselect"

function M.enable_completion()
    compe.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      resolve_timeout = 800;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = {
        border = { '', '' ,'', ' ', '', '', '', ' ' },
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1,
      };

      source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
        ultisnips = true;
        luasnip = true;
      };
    }
end

function M.disable_completion()
    compe.setup {enabled = false}
end


-- Virtual text setting
--------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

vim.api.nvim_exec([[
    augroup custom_theme_highlights
    autocmd!
        au ColorScheme * hi LspDiagnosticsDefaultError guifg=#EB4917 gui=BOLD
        au ColorScheme * hi LspDiagnosticsDefaultWarning guifg=#EBA217 gui=BOLD
        au ColorScheme * hi LspDiagnosticsDefaultInformation guifg=#17D6EB gui=BOLD
        au ColorScheme * hi LspDiagnosticsDefaultHint guifg=#17EB7A gui=BOLD
    augroup END
]], false)


-- Each LSP setting.
--------------------------------
lsp.cssls.setup {
    on_attach = completion.on_attach,
}

lsp.denols.setup{
    on_attach = completion.on_attach,
    root_dir = lsp.util.root_pattern("deps.ts"),
}

lsp.dockerls.setup{
    on_attach = completion.on_attach,
}

lsp.tsserver.setup {
    on_attach = completion.on_attach,
    root_dir = lsp.util.root_pattern("package.json")
}

lsp.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        },
    },
    on_attach = completion.on_attach,
}

return M
