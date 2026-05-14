return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = false,
            dismiss = false,
            -- handle inside cmp.lua
          },
        },
        panel = { enabled = false },
      })
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      show_help = "yes",
      model = "gpt-5.2-codex",
      window = {
        layout = "vertical",
        width = 0.4,
      },
      highlight_diff = true,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Chat" },
      { "<leader>cm", "<cmd>CopilotChatModels<cr>", desc = "CopilotChat - Select Model" },
    },
  },
}
