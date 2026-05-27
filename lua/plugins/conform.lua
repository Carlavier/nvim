local global_configs = {
  lua = {
    name = "stylua",
    filename = { "stylua.toml", ".stylua.toml" },
    found_args = { "--stdin-filepath", "$FILENAME", "-" },
    fallback_args = {
      "--config-path",
      vim.fn.expand("~/.config/nvim/formatter/stylua.toml"),
      "--stdin-filepath",
      "$FILENAME",
      "-",
    },
  },
  cpp = {
    name = "clang-format",
    filename = { ".clang-format" },
    found_args = { "--style=file", "--assume-filename", "$FILENAME" },
    fallback_args = {
      "--style=file:" .. vim.fn.expand("~/.config/nvim/formatter/.clang-format"),
      "--assume-filename",
      "$FILENAME",
    },
  },
  javascript = {
    name = "prettierd",
    filename = { ".prettierrc", ".prettierrc.json", "prettier.config.js" },
    found_args = { "--stdin-filepath", "$FILENAME", "--" },
    fallback_args = {
      "--config",
      vim.fn.expand("~/.config/nvim/formatter/.prettierrc"),
      "--stdin-filepath",
      "$FILENAME",
      "--",
    },
  },
  python = {
    name = "black",
    filename = { "pyproject.toml", "black" },
    found_args = { "--stdin-filename", "$FILENAME", "-" },
    fallback_args = {
      "--config",
      vim.fn.expand("~/.config/nvim/formatter/pyproject.toml"),
      "--stdin-filename",
      "$FILENAME",
      "-",
    },
  },
  sh = {
    name = "shfmt",
    filename = { ".editorconfig" },
    found_args = { "--stdin-filepath", "$FILENAME", "-" },
    fallback_args = { "--stdin-filepath", "$FILENAME", "-" },
  },
}

-- Map aliases
global_configs.typescript = global_configs.javascript
global_configs.typescriptreact = global_configs.javascript
global_configs.javascriptreact = global_configs.javascript
global_configs.css = global_configs.javascript
global_configs.html = global_configs.javascript

local function get_custom_args(config)
  return {
    command = config.name,
    args = function(_, ctx)
      local found = vim.fs.find(config.filename, { path = ctx.dirname, upward = true })[1]
      return found and config.found_args or config.fallback_args
    end,
  }
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = function()
    local custom_formatters = {}
    local formatters_by_ft = {}

    for ft, cfg in pairs(global_configs) do
      custom_formatters[cfg.name] = get_custom_args(cfg)
      formatters_by_ft[ft] = { cfg.name }
    end

    return {
      formatters_by_ft = formatters_by_ft,
      formatters = custom_formatters,
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },
    }
  end,
}
