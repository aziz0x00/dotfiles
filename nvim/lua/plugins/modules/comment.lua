return {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = {"<leader>c", "<leader>C"},
    config = function()
        require("Comment").setup({
            ignore = "^$",
            opleader = {
                line = "<leader>c",
                block = "<leader>C",
            },
        })
    end,
}
