return {
    "nvim-telescope/telescope.nvim",
    branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { "<leader>?", "<leader>pg", "<C-p>", "gr" },

    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader><leader>", builtin.buffers)

        vim.keymap.set("n", "<C-p>", builtin.find_files)
        vim.keymap.set("n", "<leader>s", builtin.lsp_dynamic_workspace_symbols)
        -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep)
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
        })
    end,
}
