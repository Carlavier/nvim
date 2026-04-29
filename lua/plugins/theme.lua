return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("dracula").setup({
      -- We manually override everything to guarantee the "Soft" look + your #1a1a1a
      on_colors = function(colors, color)
        -- YOUR CUSTOM BACKGROUNDS
        colors.bg = "#1a1a1a"          -- Match your VS Code editor.background
        colors.bg_dark = "#141414"     -- Match your sidebar.background
        colors.bg_float = "#141414"    -- Match your floating windows
        
        -- DRACULA SOFT SYNTAX (Muted/Desaturated)
        colors.selection = "#414458"
        colors.purple = "#caa9fa"
        colors.cyan = "#9aedfe"
        colors.pink = "#ff92d0"
        colors.yellow = "#f4f99d"
        colors.green = "#63f589"
        colors.orange = "#ffc992"
        colors.red = "#ff6e6e"
      end,
    })
    vim.cmd([[colorscheme dracula]])

    -- FORCE UI CONSISTENCY
    local hl = vim.api.nvim_set_hl
    hl(0, "Normal", { bg = "#1a1a1a" })
    hl(0, "NormalFloat", { bg = "#141414" })
    hl(0, "NvimTreeNormal", { bg = "#141414" })
    hl(0, "NvimTreeNormalNC", { bg = "#141414" })
    -- Remove the ~ tildes on empty lines to keep it clean
    hl(0, "EndOfBuffer", { fg = "#1a1a1a" }) 
  end,
}
