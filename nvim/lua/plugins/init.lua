vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugin modules
require("lazy").setup({
    { "tpope/vim-sleuth" },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {
            text = { done = "" },
            window = { blend = 0 },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        keys = { { "<leader>c", "<cmd>ColorizerToggle<CR>", mode = "n" } },
        opts = {},
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.x",
        opts = { show_current_context = true },
        -- main = "ibl",
        -- opts = { scope = { enabled = true } },
    },

    {
        "mbbill/undotree",
        lazy = true,
        keys = { { "<leader>u", vim.cmd.UndotreeToggle } },
        config = function()
            vim.keymap.set("n", "<leader>u", function()
                vim.cmd.UndotreeToggle()
                vim.cmd.UndotreeFocus()
            end)
        end,
    },
    {
        "monaqa/dial.nvim",
        keys = { "<C-a>", "<C-x>" },
    },
    { "tpope/vim-fugitive", keys = { { "<leader>g", "<cmd>Git<CR>" } } },
    { "lewis6991/gitsigns.nvim", opts = {} },

    -- {
    --     "luckasRanarison/tailwind-tools.nvim",
    --     dependencies = { "nvim-treesitter/nvim-treesitter" },
    --     opts = {
    --         ---@type TailwindTools.Option
    --         document_color = {
    --             enabled = true, -- can be toggled by commands
    --             kind = "inline", -- "inline" | "foreground" | "background"
    --             inline_symbol = "󰝤 ", -- only used in inline mode
    --             debounce = 200, -- in milliseconds, only applied in insert mode
    --         },
    --         conceal = {
    --             enabled = false, -- can be toggled by commands
    --             min_length = nil, -- only conceal classes exceeding the provided length
    --             symbol = "󱏿", -- only a single character is allowed
    --             highlight = { -- extmark highlight options, see :h 'highlight'
    --                 fg = "#38BDF8",
    --             },
    --         },
    --         custom_filetypes = {}, -- see the extension section to learn how it works
    --     }, -- your configuration
    -- },

    -- {
    --     "lervag/vimtex",
    --     lazy = false, -- we don't want to lazy load VimTeX
    --     -- tag = "v2.15", -- uncomment to pin to a specific release
    --     init = function()
    --         -- VimTeX configuration goes here, e.g.
    --         vim.g.vimtex_view_method = "zathura"
    --     end,
    -- },

    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure({

                "lsp",
                "treesitter",
                -- 'regex',
            })
        end,
    },

    -- {
    --     "github/copilot.vim",
    --     event = "BufEnter",
    -- },

    {
        "chomosuke/typst-preview.nvim",
        opts = {
            dependencies_bin = {
                ["tinymist"] = "tinymist",
                ["websocat"] = nil,
            },
        },
    },

    -- {
    --     "Exafunction/codeium.vim",
    --     event = "BufEnter",
    -- },

    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    -- },

    {
        "hedyhli/outline.nvim",
        config = function()
            -- Example mapping to toggle outline
            vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

            local lazy_kinds = {
                Array = " ",
                Boolean = "󰨙 ",
                Class = " ",
                Codeium = "󰘦 ",
                Color = " ",
                Control = " ",
                Collapsed = " ",
                Constant = "󰏿 ",
                Constructor = " ",
                Copilot = " ",
                Enum = " ",
                EnumMember = " ",
                Event = " ",
                Field = " ",
                File = " ",
                Folder = " ",
                Function = "󰊕 ",
                Interface = " ",
                Key = " ",
                Keyword = " ",
                Method = "󰊕 ",
                Module = " ",
                Namespace = "󰦮 ",
                Null = " ",
                Number = "󰎠 ",
                Object = " ",
                Operator = " ",
                Package = " ",
                Property = " ",
                Reference = " ",
                Snippet = "󱄽 ",
                String = " ",
                Struct = "󰆼 ",
                Supermaven = " ",
                TabNine = "󰏚 ",
                Text = " ",
                TypeParameter = " ",
                Unit = " ",
                Value = " ",
                Variable = "󰀫 ",
            }

            local defaults = require("outline.config").defaults

            local outline_kinds = {}

            for kind, symbol in pairs(defaults.symbols.icons) do
                outline_kinds[kind] = {
                    icon = lazy_kinds[kind] or symbol.icon,
                    hl = symbol.hl,
                }
            end

            require("outline").setup({
                -- Your setup opts here (leave empty to use defaults)
                symbols = {
                    icons = outline_kinds,
                },
            })
        end,
    },

    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            --
            -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
            -- - sd'   - [S]urround [D]elete [']quotes
            -- - sr)'  - [S]urround [R]eplace [)] [']
            -- require("mini.surround").setup()

            require("mini.pairs").setup()
        end,
    },

    { import = "plugins.modules" },
}, {
    checker = { notify = false },
    change_detection = { notify = false },
    performance = {
        rtp = {
            disabled_plugins = {
                -- "netrwPlugin",
                "tohtml",
                "tutor",
            },
        },
    },
})
