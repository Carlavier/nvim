return {
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme citruszest")
    end,
  },
  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
  },
}
