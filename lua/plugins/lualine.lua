return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      globalstatus = true,
    },
    config = function()
      local custom_theme = {
        normal = {
          a = { fg = "#000000", bg = "#0055ff", gui = "bold" },
          b = { fg = "#ffffff", bg = "#444444" },
          c = { fg = "#eeeeee", bg = "#1a1a1a" },
        },
        insert = { a = { fg = "#000000", bg = "#ff0000", gui = "bold" } },
        visual = { a = { fg = "#000000", bg = "#ffff00", gui = "bold" } },
        replace = { a = { fg = "#000000", bg = "#00ff00", gui = "bold" } },
        -- Command mode added with Orange accent
        command = { a = { fg = "#000000", bg = "#ff8800", gui = "bold" } },
        inactive = {
          a = { fg = "#666666", bg = "#000000" },
          b = { fg = "#666666", bg = "#000000" },
          c = { fg = "#666666", bg = "#000000" },
        },
      }

      require("lualine").setup({
        options = {
          theme = custom_theme,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
