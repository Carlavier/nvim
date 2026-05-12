return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  -- Lazy.nvim automatically calls the setup function with these opts
  opts = {
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
    highlight = {
      enable = true,
      -- Setting this to false is preferred for performance
      additional_vim_regex_highlighting = false,
    },
  },
  -- Remove the custom config block entirely.
  -- Lazy.nvim knows how to initialize nvim-treesitter without the deprecated 'configs' module.
}
