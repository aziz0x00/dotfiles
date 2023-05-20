return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>",              silent = true },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>",  silent = true },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", silent = true },
        { "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>",        silent = true },
    },
    opts = {},
}
