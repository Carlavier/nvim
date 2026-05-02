return {
  'folke/flash.nvim',
  event = 'VimEnter',
  opts = {
    modes = {
      char = {
        enabled = true,
        jump_labels = true,
        autohide = false,
        multi_line = false,
        highlight = { backdrop = false },
        motions = {
          f = { enabled = true, search = { forward = true } },
          F = { enabled = true, search = { forward = false } },
          t = { enabled = true, search = { forward = true, offset = -1 } },
          T = { enabled = true, search = { forward = false, offset = 1 } },
        },
        char_actions = function(motion)
          return {
            ['h'] = 'next',
            [','] = 'prev',
            [motion:lower()] = 'next',
            [motion:upper()] = 'prev',
          }
        end,
      },
      search = {
        enabled = true,
        highlight = { label = { hl_group = 'MyFlashRed' } },
        search = { multi_line = true },
        jump = { history = true, register = true, nohlsearch = true },
      },
    },
  },
  config = function(_, opts)
    require('flash').setup(opts)

    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#000000', bg = '#ff0000', bold = true })
  end,
}
