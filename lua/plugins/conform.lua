return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
		},
		formatters = {
			stylua = {
				-- Force StyLua to use your Nvim config file globally
				prepend_args = { "--config-path", vim.fn.expand("./format/.stylua.toml") },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
