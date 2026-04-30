return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then return end
        return 'make install_jsregexp'
      end)(),
      dependencies = {},
      opts = {},
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<Esc>'] = { 'hide', 'fallback' },
    },
    appearance = { nerd_font_variant = 'mono' },
    completion = {
      ghost_text = { enabled = true },
      menu = {
        auto_show = true,
      },
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },

    sources = {
      default = { 'lsp', 'path', 'snippets' },
    },

    snippets = {
      preset = 'luasnip',
    },

    fuzzy = { implementation = 'lua' },

    signature = { enabled = true },
  },
  config = function(_, opts)
    require('blink.cmp').setup(opts)

    vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', { link = 'Comment', bg = 'NONE', blend = 0 })

    vim.api.nvim_create_autocmd('InsertLeave', {
      callback = function()
        vim.schedule(function() require('blink.cmp').hide() end)
      end,
    })
  end,
}
