return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                'ts_ls',
                'html',
                'cssls',
                'tailwindcss',
                'lua_ls',
                'eslint',
                'basedpyright',
            }
        }
    }
}
