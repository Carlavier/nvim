return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "v0.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label",     "label_description", gap = 1 },
            { "kind_icon", "kind",              gap = 1 },
          },
        },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      list = { selection = { preselect = false, auto_insert = true } },
    },
    keymap = {
      preset = "default",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-n>"] = {},
      ["<C-p>"] = {},
      ["<Tab>"] = { "select_and_accept", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Esc>"] = { "hide", "fallback" },
    },

    cmdline = {
      enabled = false, -- Temporarily disabling cmdline to eliminate target source vector errors
    },
  },
}
