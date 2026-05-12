local global_configs = {
  lua = {
    name = "stylua",
    filename = { "stylua.toml", ".stylua.toml" },
    path = vim.fn.expand("~/.config/nvim/formatter/stylua.toml"),
    config_flag = "--config-path",
  },
  cpp = {
    name = "clang-format",
    filename = { ".clang-format" },
    path = vim.fn.expand("~/.config/nvim/formatter/.clang-format"),
    config_flag = "--style=file:",
  },
  javascript = {
    name = "prettier",
    filename = { ".prettierrc", ".prettierrc.json", "prettier.config.js" },
    path = vim.fn.expand("~/.config/nvim/formatter/.prettierrc"),
    config_flag = "--config",
  },
  python = {
    name = "black",
    filename = { "pyproject.toml", "black" },
    path = vim.fn.expand("~/.config/nvim/formatter/pyproject.toml"),
    config_flag = "--config",
  },
}

global_configs.typescript = global_configs.javascript
global_configs.typescriptreact = global_configs.javascript
global_configs.javascriptreact = global_configs.javascript

local function get_custom_args(config)
  return {
    command = config.name,
    args = function(self, ctx)
      local found = vim.fs.find(config.filename, {
        path = ctx.dirname,
        upward = true,
      })[1]

      if found then
        if config.name == "clang-format" then
          return { "--style=file", "--assume-filename", "$FILENAME" }
        end
        return { "--stdin-filepath", "$FILENAME", "-" }
      else
        if config.name == "clang-format" then
          return { "--style=file:" .. config.path, "--assume-filename", "$FILENAME" }
        end
        return { config.config_flag, config.path, "--stdin-filepath", "$FILENAME", "-" }
      end
    end,
  }
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = function()
    local custom_formatters = {}
    for _, cfg in pairs(global_configs) do
      custom_formatters[cfg.name] = get_custom_args(cfg)
    end

    return {
      formatters_by_ft = {
        lua = { "stylua" },
        cpp = { "clang-format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        python = { "black" },
        sh = { "shfmt" },
      },
      formatters = custom_formatters,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    }
  end,
}
