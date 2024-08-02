local autocmd = vim.api.nvim_create_autocmd

-- highlight on text copy
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- trim spaces in eol
-- autocmd("BufWritePre", {
--     pattern = "*",
--     command = [[%s/\s\+$//e]],
-- })

-- get cursor back where it's been after buffer closes
-- thanks to https://github.com/adibhanna/nvim
autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- don't comment on new line
autocmd("BufEnter", {
    command = [[set formatoptions-=cro]],
})

autocmd("FileType", {
    callback = function()
        if vim.bo.filetype == "python" then
            vim.keymap.set("n", "<leader>X", ":sp term://python % <CR>")
        elseif vim.bo.filetype == "go" then
            vim.keymap.set("n", "<leader>X", ":sp term://go run % <CR>")
        end
    end,
})
