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
        { "<leader>e", ":Neotree focus right reveal<CR>",              silent = true },
        { "<leader>E", ":Neotree focus right reveal_force_cwd<CR>",    silent = true },
    },
    config = function()
        vim.g.neo_tree_remove_legacy_commands = 1

        require("neo-tree").setup({
            enable_git_status = false,
            window = { width = 35 },
            filesystem = {
                group_empty_dirs = true,                -- when true, empty folders will be grouped together
                hijack_netrw_behavior = "open_current", -- "open_default", -- netrw disabled, opening a directory opens neo-tree
                filtered_items = { hide_by_name = { "node_modules", "__pycache__" } },
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

            document_symbols = {
                follow_cursor = true,

                kinds = {
                    File = { icon = "󰈙", hl = "Tag" },
                    Namespace = { icon = "󰌗", hl = "Include" },
                    Package = { icon = "󰏖", hl = "Label" },
                    Class = { icon = "󰌗", hl = "Include" },
                    Property = { icon = "󰆧", hl = "@property" },
                    Enum = { icon = "󰒻", hl = "@number" },
                    Function = { icon = "󰊕", hl = "Function" },
                    String = { icon = "󰀬", hl = "String" },
                    Number = { icon = "󰎠", hl = "Number" },
                    Array = { icon = "󰅪", hl = "Type" },
                    Object = { icon = "󰅩", hl = "Type" },
                    Key = { icon = "󰌋", hl = "" },
                    Struct = { icon = "󰌗", hl = "Type" },
                    Operator = { icon = "󰆕", hl = "Operator" },
                    TypeParameter = { icon = "󰊄", hl = "Type" },
                    StaticMethod = { icon = "󰠄 ", hl = "Function" },
                },
            },
            sources = {
                "filesystem",
                "document_symbols",
            },
        })
    end,
}
