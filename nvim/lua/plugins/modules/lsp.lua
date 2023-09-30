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
            -- local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

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

            -- lsp.ensure_installed({
            --     "tsserver",
            --     "pyright",
            -- })

            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr }
                lsp.default_keymaps(opts)

                -- keep Telescope on lazy load <3
                vim.keymap.set("n", "gr", function()
                    require("telescope.builtin").lsp_references()
                end, opts)
                vim.keymap.set("n", "gd", function()
                    require("telescope.builtin").lsp_definitions()
                end, opts)

                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format()
                end, opts)

                vim.keymap.set("n", "<leader>r", function()
                    vim.lsp.buf.rename()
                end, opts)

                vim.keymap.set("n", "<leader>ca", function()
                    vim.lsp.buf.code_action()
                end, opts)

                -- if client.server_capabilities.documentHighlightProvider then
                --     local gid = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                --     vim.api.nvim_create_autocmd("CursorHold", {
                --         group = gid,
                --         buffer = bufnr,
                --         callback = function()
                --             vim.lsp.buf.document_highlight()
                --         end,
                --     })
                --     vim.api.nvim_create_autocmd("CursorHoldI", {
                --         group = gid,
                --         buffer = bufnr,
                --         callback = function()
                --             vim.lsp.buf.document_highlight()
                --         end,
                --     })
                --     vim.api.nvim_create_autocmd("CursorMoved", {
                --         group = gid,
                --         buffer = bufnr,
                --         callback = function()
                --             vim.lsp.buf.clear_references()
                --         end,
                --     })
                -- end
            end)

            -- (Optional) Configure lua language server for neovim
            require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

            require("lspconfig").texlab.setup({
                settings = {
                    texlab = {
                        forwardSearch = {
                            executable = "zathura",
                            args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                        auxDirectory = ".build",
                        bibtexFormatter = "texlab",
                        build = {
                            args = { "%f", "--synctex", "--keep-logs", "--keep-intermediates", "--outdir", ".build" },
                            executable = "tectonic",
                            forwardSearchAfer = true,
                            onSave = true,
                        },
                    },
                },
            })
            -- require("lspconfig").intelephense.setup({
            --     intelephense = { environment = { documentRoot = "." } },
            -- })

            --             {
            --   "texlab.build.executable": "tectonic",
            --   "texlab.build.args": [
            --     "-X",
            --     "compile",
            --     "%f",
            --     "--synctex",
            --     "--keep-logs",
            --     "--keep-intermediates"
            --   ]
            -- }
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
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier.with({
                        timeout = -1,
                        extra_args = { "--tab-width=4" },
                    }),
                    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
                    null_ls.builtins.formatting.shfmt.with({ extra_args = { "--indent=4" } }),
                },
            })
        end,
    },
}
