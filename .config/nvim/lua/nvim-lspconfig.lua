--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'lspconfig'
local completion = require'completion'
local util = require 'lspconfig/util'

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            },
        },
    },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)


lsp.tsserver.setup {
    on_attach = completion.on_attach,
    cmd = {
        "typescript-language-server", "--stdio"
    },
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
    },
    root_dir = util.root_pattern("package.json", "tsconfig.json", ".git"),
}


lsp.metals.setup {}


lsp.pyls_ms.setup {}


lsp.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehaviour = "full",
                importPrefix = "plain"
            },
            callInfo = true,
            cargo = {
                allFeatures = true,
                autoreload = true,
                features = {},
                loadOutDirsFromCheck = nil,
                noDefaultFeatures = nil,
                target = vim.NIL,
            },
            cargoRunner = vim.NIL,
            checkOnSave = {
                allFeatures = vim.NIL,
                allTargets = true,
                command = "check",
                enable = true,
                extraArgs = {},
                features = vim.NIL,
                noDefaultFeatures = vim.NIl,
                overrideCommand = vim.NIl,
                target = vim.Nil,
            },
            completion = {
                addCallArgumentSnippets = true,
                addCallParenthesis = true,
                postfix = {
                    enable = true,
                },
            },
            debug = {
                engine = "auto",
                engineSettings = vim.empty_dict(),
                openDebugPane = false,
                sourceFileMap = {["/rustc/<id>"] = "${env:USERPROFILE}/.rustup/toolchains/<toolchain-id>/lib/rustlib/src/rust"},
            },
            diagnostics = {
                disabled = {},
                enable = true,
                enableExperimental = true,
                warningsAsHint = {},
            },
            files = {
                exclude = {},
                watcher = "client",
            },
            hoverActions = {
                debug = true,
                enable = true,
                gotoTypeDef = true,
                implementations = true,
                run = true,
            },
            inlayHints = {
                chainingHints = true,
                enable = true,
                maxLength = 20,
                parameterHints = true,
                typeHints = true,
            },
            lens = {
                debug = true,
                enable = true,
                implementations = true,
                methodReferences = nil,
                run = true,
            },
            linkedProjects = vim.NIl,
            lruCapacity = vim.NIL,
            noSysroot = nil,
            notifications = {
                cargoTomlNotFound = true,
            },
            procMacro = {
                enable = true,
            },
            runnableEnv = vim.NIL,
            runnables = {
                cargoExtraArgs = {},
                overrideCargo = vim.NIL,
            },
            rustcSource = vim.NIL,
            rustfmt = {
                extraArgs = {},
                overrideCommand = vim.NIL,
            },
            serverPath = vim.NIL,
            trace = {
                extension = false,
                server = "off",
            },
            updates = {
                askBeforeDownload = true,
                channel = "stable"
            },
        },
    },
    capabilities = capabilities,
}
