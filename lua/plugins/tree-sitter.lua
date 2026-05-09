return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
      local ts = require('nvim-treesitter')

      ts.install({ 'python', 'javascript', 'typescript', 'lua' })
  end,
}
