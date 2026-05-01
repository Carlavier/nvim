return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
    },
    formatters = {
      stylua = {
        prepend_args = { '--config-path', vim.fn.stdpath('config') .. '/format/.stylua.toml' },
      },
      ['clang-format'] = {
        prepend_args = {
          '-style=file:' .. vim.fn.stdpath('config') .. '/format/.clang-format',
        },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
