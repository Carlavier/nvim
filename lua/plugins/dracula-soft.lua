return {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('dracula').setup({
      on_colors = function(colors, color)
        colors.bg = '#1a1a1a'
        colors.bg_dark = '#141414'
        colors.bg_float = '#141414'
        colors.selection = '#414458'
        colors.purple = '#caa9fa'
        colors.cyan = '#9aedfe'
        colors.pink = '#ff92d0'
        colors.yellow = '#f4f99d'
        colors.green = '#63f589'
        colors.orange = '#ffc992'
        colors.red = '#ff6e6e'
      end,
    })

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'dracula',
      callback = function()
        local hl = vim.api.nvim_set_hl
        hl(0, 'Normal', { bg = '#1a1a1a' })
        hl(0, 'NormalFloat', { bg = '#141414' })
        hl(0, 'NvimTreeNormal', { bg = '#141414' })
        hl(0, 'NvimTreeNormalNC', { bg = '#141414' })
        hl(0, 'EndOfBuffer', { fg = '#1a1a1a' })
      end,
    })

    -- vim.cmd.colorScheme("dracula")
  end,
}
