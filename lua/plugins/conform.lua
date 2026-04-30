return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
    },
    formatters = {
      stylua = {
        prepend_args = { '--config-path', vim.fn.stdpath('config') .. '/format/.stylua.toml' },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
