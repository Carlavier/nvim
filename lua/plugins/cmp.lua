return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
  },
  version = "*",
  build = function()
    require("blink.cmp").build()
  end,

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
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
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_and_accept()
          end

          local copilot = require("copilot.suggestion")
          if copilot.is_visible() then
            copilot.accept()
            return true
          end
        end,
        "fallback",
      },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<Esc>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.hide()
            return true
          end

          local copilot = require("copilot.suggestion")
          if copilot.is_visible() then
            copilot.dismiss()
            return true
          end
        end,
        "fallback",
      },
    },

    cmdline = {
      enabled = true,
      completion = {
        menu = { auto_show = false },
      },
      keymap = {
        preset = "default",
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-n>"] = {},
        ["<C-p>"] = {},
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
      },
    },

    sources = { default = { "lsp", "path", "snippets" } },
    fuzzy = { implementation = "rust" },
  },
}
