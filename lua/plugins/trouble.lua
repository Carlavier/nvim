return {
  'folke/trouble.nvim',
  opts = {
    modes = {
      diagnostics = {
        mode = 'diagnostics',
        focus = true,
        auto_jump = false,
        auto_close = false,
        win = { position = 'bottom' },
        preview = {
          type = 'split',
          relative = 'win',
          position = 'right',
          size = 0.4,
        },
        filter = {
          any = {
            buf = 0,
            {
              severity = vim.diagnostic.severity.ERROR,
              function(item) return item.filename:find((vim.loop or vim.uv).cwd(), 1, true) end,
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    require('trouble').setup(opts)

    local hl = vim.api.nvim_set_hl
    hl(0, 'TroubleNormal', { bg = '#000000', fg = '#ffffff' })
    hl(0, 'TroubleNormalNC', { bg = '#000000', fg = '#ffffff' })

    hl(0, 'TroubleIconError', { fg = '#FF0000', bg = '#000000', bold = true })
    hl(0, 'TroubleIconWarning', { fg = '#FFFF00', bg = '#000000', bold = true })
  end,
  keys = {
    {
      '<leader>qq',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Dianostics [Q]uickfix list (Trouble)',
    },
  },
}
