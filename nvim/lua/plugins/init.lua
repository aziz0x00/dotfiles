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
        opts = { show_current_context = true },
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
    -- { "lervag/vimtex",           ft = "tex" },

    -- { "RRethy/vim-illuminate" },

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
