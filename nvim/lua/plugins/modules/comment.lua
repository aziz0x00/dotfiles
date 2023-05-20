return {
    "numToStr/Comment.nvim",
    keys = { { "<leader>c", mode = "v" }, { "<leader>C", mode = "v" } },
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
