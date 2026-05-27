return {
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "DrKJeff16/project.nvim",
  },
  keys = {
    { "<leader>sf", desc = "Search Files" },
    { "<leader>sg", desc = "Search by Grep" },
    { "<leader>sb", desc = "Search Buffers" },
    { "<leader>sh", desc = "Search Help" },
    { "<leader>sk", desc = "Search Keymaps" },
    { "<leader>sc", desc = "Search Commands" },
    { "<leader>si", desc = "Search Git Files" },
    { "<leader>sp", desc = "Search Projects" },
    { "<leader>sn", desc = "Search Neovim Config" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    require("project").setup({
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = {
        ".git",
        ".github",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        "Pipfile",
        "pyproject.toml",
        ".nvim.lua",
      },
      lsp = {
        enabled = true,
        use_pattern_matching = false,
      },
      telescope = {
        mappings = {
          n = {
            ["f"] = "find_project_files",
            ["b"] = "browse_project_files",
            ["d"] = "delete_project",
            ["s"] = "search_in_project_files",
            ["r"] = "recent_project_files",
            ["w"] = "change_working_directory",
          },
          i = {
            ["<C-f>"] = "find_project_files",
            ["<C-b>"] = "browse_project_files",
            ["<C-d>"] = "delete_project",
            ["<C-s>"] = "search_in_project_files",
            ["<C-r>"] = "recent_project_files",
            ["<C-w>"] = "change_working_directory",
          },
        },
      },
    })

    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules/",
          "%.git/",
          "venv/",
          "%.venv/",
          "__pycache__/",
          "%.o",
          "%.a",
          "%.out",
          "%.bin",
        },
        mappings = {
          i = {
            ["<C-h>"] = function()
              vim.api.nvim_input("<C-w>")
            end,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("projects")

    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Search Buffers" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
    vim.keymap.set("n", "<leader>sc", builtin.commands, { desc = "Search Commands" })
    vim.keymap.set("n", "<leader>si", builtin.git_files, { desc = "Search Git Files" })
    vim.keymap.set("n", "<leader>sp", telescope.extensions.projects.projects, { desc = "Search Projects" })

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "Search Neovim Config" })
  end,
}
