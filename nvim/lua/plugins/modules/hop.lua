return {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = true,
    keys = { { "<leader>h", ":HopAnywhere<cr>" } },
    config = function()
        -- Configuration here, or leave empty to use defaults
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
}
