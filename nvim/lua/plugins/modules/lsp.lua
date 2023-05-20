return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        lazy = true,
        config = function()
            -- This is where you modify the settings for lsp-zero
            -- Note: autocompletion settings will not take effect

            require("lsp-zero.settings").preset({})
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            -- Here is where you configure the autocompletion settings.
            -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

            require("lsp-zero.cmp").extend()

            -- And you can configure cmp even more, if you want to.
            local cmp = require("cmp")
            local cmp_action = require("lsp-zero.cmp").action()

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                preselect = "item",
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "buffer",  keyword_length = 3 },
                    { name = "luasnip", keyword_length = 2 },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                    ["<Tab>"] = cmp_action.luasnip_supertab(),
                    ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
                }),
            })
        end,
    },

    -- LSP
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "williamboman/mason-lspconfig.nvim" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
        },
        config = function()
            -- This is where all the LSP shenanigans will live

            local lsp = require("lsp-zero").preset("recommended")

            lsp.ensure_installed({
                "tsserver",
                "pyright",
            })

            lsp.on_attach(function(_, bufnr)
                local opts = { buffer = bufnr }
                lsp.default_keymaps(opts)
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
                vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
            end)

            -- (Optional) Configure lua language server for neovim
            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            lsp.setup()
        end,
    },

    -- null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        event = "VeryLazy",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier.with({
                        extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
                    }),
                    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
                    null_ls.builtins.formatting.shfmt.with({ extra_args = { "--indent=4" } }),
                },
            })
        end,
    },
}
