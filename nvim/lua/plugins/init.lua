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
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "InsertEnter",
        opts = {},
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        version = "2.x",
        opts = { show_current_context = true },
        -- main = "ibl",
        -- opts = { scope = { enabled = true } },
    },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
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
    { "tpope/vim-fugitive",      keys = { { "<leader>g", "<cmd>Git<CR>" } } },
    { "lewis6991/gitsigns.nvim", opts = {} },

    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            ---@type TailwindTools.Option
            document_color = {
                enabled = true, -- can be toggled by commands
                kind = "inline", -- "inline" | "foreground" | "background"
                inline_symbol = "󰝤 ", -- only used in inline mode
                debounce = 200, -- in milliseconds, only applied in insert mode
            },
            conceal = {
                enabled = false, -- can be toggled by commands
                min_length = nil, -- only conceal classes exceeding the provided length
                symbol = "󱏿", -- only a single character is allowed
                highlight = { -- extmark highlight options, see :h 'highlight'
                    fg = "#38BDF8",
                },
            },
            custom_filetypes = {}, -- see the extension section to learn how it works
        },                         -- your configuration
    },

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
