return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    -- or                              , branch = '0.1.1',
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader><leader>", builtin.buffers)

        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        -- vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set("n", "<leader>?", function()
            builtin.oldfiles({ only_cwd = true })
        end)
    end,
}
