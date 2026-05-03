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
        local bg_dark_blue = '#0e111a'
        -- local bg_even_darker_blue = '#0e111a'

        hl(0, 'Normal', { bg = bg_black })
        hl(0, 'NormalNC', { bg = bg_black })
        hl(0, 'NormalFloat', { bg = bg_black })
        hl(0, 'NvimTreeNormal', { bg = bg_black })
        hl(0, 'NvimTreeNormalNC', { bg = bg_black })
        hl(0, 'LineNr', { bg = bg_black })
        hl(0, 'SignColumn', { bg = bg_black })
        hl(0, 'EndOfBuffer', { fg = bg_black, bg = bg_black })
        hl(0, 'CursorLine', { bg = '#141414' })

        local dark_blue_groups = {
          'TelescopeNormal',
          'TelescopeBorder',
          'TelescopePromptNormal',
          'TelescopePromptBorder',
          'TelescopeResultsNormal',
          'TelescopeResultsBorder',
          'TelescopePreviewNormal',
          'TelescopePreviewBorder',
        }

        for _, group in ipairs(dark_blue_groups) do
          hl(0, group, { bg = bg_dark_blue })
        end

        hl(0, 'BufferLineBufferSelected', { fg = '#eeeeee', bg = bg_black, bold = true })
        hl(0, 'BufferLineIndicatorSelected', { fg = '#ff0000', bg = bg_black })
        hl(0, 'BufferLineDuplicateSelected', { fg = '#ff6347', bg = bg_black, italic = true })
        hl(0, 'BufferLineDuplicate', { fg = '#692020', italic = true })
        hl(0, 'BufferLineDuplicateVisible', { fg = '#692020', italic = true })
      end,
    })

    vim.cmd([[colorscheme bearded-arc]])
  end,
}
