return {
  'kcayme/bearded-arc.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'bearded-arc',
      callback = function()
        local hl = vim.api.nvim_set_hl
        local bg_black = '#000000'
        local bg_dark_blue = '#080a0f'

        hl(0, 'Normal', { bg = bg_black })
        hl(0, 'NormalFloat', { bg = bg_black })
        hl(0, 'NvimTreeNormal', { bg = bg_black })
        hl(0, 'NvimTreeNormalNC', { bg = bg_black })
        hl(0, 'LineNr', { bg = bg_black })
        hl(0, 'SignColumn', { bg = bg_black })
        hl(0, 'EndOfBuffer', { fg = bg_black, bg = bg_black })
        hl(0, 'CursorLine', { bg = '#141414' })

        local groups = {
          'TelescopeNormal',
          'TelescopeBorder',
          'TelescopePromptNormal',
          'TelescopePromptBorder',
          'TelescopeResultsNormal',
          'TelescopeResultsBorder',
          'TelescopePreviewNormal',
          'TelescopePreviewBorder',
        }
        for _, group in ipairs(groups) do
          hl(0, group, { bg = bg_dark_blue })
        end
      end,
    })

    vim.cmd([[colorscheme bearded-arc]])
  end,
}
