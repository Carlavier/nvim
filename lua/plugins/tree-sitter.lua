return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "cpp",
        "typescript",
        "javascript",
        "html",
        "css",
        "python",
        "lua",
        "vim",
        "vimdoc",
      },
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
