local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { global = { 'vim' } }
            },
        },
    },

    vtsls = {},

    pyright = {
        settings = {
            python = {
                analysis = {
                    extraPaths = { "src" },
                    autoImportCompletions = true,
                    diagnosticMode = "workspace",
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic",
                },
            },
        },
    },
}

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
        config = function()
            vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

            local capabilities = require('blink.cmp').get_lsp_capabilities()
            for server_name, config in pairs(servers) do
                config.capabilities = capabilities
                vim.lsp.config(server_name, config)
                vim.lsp.enable(server_name)
            end
        end,
    },
}
