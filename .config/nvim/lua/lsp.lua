vim.cmd('packadd nvim-lsp')
require'nvim_lsp'.rls.setup{}
require'nvim_lsp'.rust_analyzer.setup{}
require'nvim_lsp'.metals.setup{}

-------------------------
-- Other setting example
-------------------------
-- nvim_lsp.rls.setup {
    -- settings = {
        -- rust = {
            -- clippy_preference = 'off';
            -- show_warnings = false;
            -- show_hover_context = false;
        -- }
    -- }
-- }

-- if not nvim_lsp.scala_lsp then
    -- configs.scala_lsp = {
        -- default_config = {
            -- cmd = {'metals-vim'};
            -- filetypes = {'scala', 'sbt'};
            -- root_dir = nvim_lsp.util.root_pattern('build.sbt');
    -- };
  -- }
-- end
