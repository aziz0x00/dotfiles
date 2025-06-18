return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },
    event = "VimEnter",
    -- keys = { "<leader>?", "<leader>pg", "<C-p>", "gr" },

    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader><leader>", builtin.buffers)
        vim.keymap.set("n", "<C-p>", builtin.find_files)
        -- vim.keymap.set("n", "<leader>s", builtin.lsp_dynamic_workspace_symbols)
        -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep)
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
        vim.keymap.set("n", "<leader>?", function()
            builtin.oldfiles({ only_cwd = true })
        end)
        vim.keymap.set("n", "<leader>;", builtin.resume)

        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
            },
        })

        require("telescope").load_extension("ui-select")
    end,
}
