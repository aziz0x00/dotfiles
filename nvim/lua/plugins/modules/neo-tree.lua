return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    keys = {
        { "<leader>v", ":Neotree toggle current reveal_force_cwd<CR>", silent = true },
        { "<leader>e", ":Neotree toggle<CR>", silent = true },
        { "<leader>E", ":Neotree toggle reveal_force_cwd<CR>", silent = true },
    },
    config = function()

        vim.g.neo_tree_remove_legacy_commands = 1

        require("neo-tree").setup({
            enable_git_status = false,
            filesystem = {
                group_empty_dirs = true, -- when true, empty folders will be grouped together
                hijack_netrw_behavior = "open_current", -- "open_default", -- netrw disabled, opening a directory opens neo-tree
                -- window = {
                --    mappings = {
                --        ["/"] = "telescope_fzf",
                --    }
                -- },

                -- commands = {
                --     telescope_fzf = function ()
                --         require("telescope.builtin").fd()
                --     end
                -- }
            },
        })
    end,
}
