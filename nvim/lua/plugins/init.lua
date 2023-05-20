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
        opts = {
            text = { done = "" },
            window = { blend = 0 },
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        keys = { { "<leader>c", "<cmd>ColorizerToggle<CR>" } },
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
        opts = {
            show_current_context = true,
        },
    },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    {
        "mbbill/undotree",
        lazy = true,
        keys = { { "<leader>u", vim.cmd.UndotreeToggle } },
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end,
    },

    {
        "monaqa/dial.nvim",
        keys = { "<C-a>", { "<C-x>", mode = "n" } },
    },

    { "RRethy/vim-illuminate" },

    { import = "plugins.modules" },
}, {
    -- defaults = {
    --     lazy = false,
    --     version = nil,
    -- },
    install = {
        missing = true,
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "tohtml",
                "tutor",
            },
        },
    },
})
