return {
    "stevearc/oil.nvim",
    opts = {},
    config = function()
        require("oil").setup({

            default_file_explorer = false,

            keymaps = {
                ["P"] = "actions.preview",
                ["<C-p>"] = false,
            },
            view_options = {
                show_hidden = false,
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
