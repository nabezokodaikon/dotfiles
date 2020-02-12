local M = {}

function M.makeScratch()
    local nvim_lsp = require'nvim_lsp'
    local configs = require'nvim_lsp/skeleton'

    -- Rust
    require'nvim_lsp'.rls.setup{}
    -- nvim_lsp.rls.setup {
        -- settings = {
            -- rust = {
                -- clippy_preference = 'off';
                -- show_warnings = false;
                -- show_hover_context = false;
            -- }
        -- }
    -- }
    -- rust_analyzer
    require'nvim_lsp'.rust_analyzer.setup{}

    -- Scala
    require'nvim_lsp'.metals.setup{}
    -- if not nvim_lsp.scala_lsp then
        -- configs.scala_lsp = {
            -- default_config = {
                -- cmd = {'metals-vim'};
                -- filetypes = {'scala', 'sbt'};
                -- root_dir = nvim_lsp.util.root_pattern('build.sbt');
        -- };
      -- }
    -- end
end

return M
