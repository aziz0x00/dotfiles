-- text encoding on the fly :D
vim.keymap.set("v", "<leader>b", [[c<C-r>=system('sed -z "s/\n$//" | base64 -w 0', @")<CR><Esc>]])
vim.keymap.set("v", "<leader>B", [[c<C-r>=system('base64 -d 2>/dev/null', @")<CR><Esc>]])
vim.keymap.set("v", "<leader>u", [[c<C-r>=system('php -r "echo urlencode(file_get_contents(\"php://stdin\"));"', @")<CR><Esc>]])
vim.keymap.set("v", "<leader>U", [[c<C-r>=system('php -r "echo urldecode(file_get_contents(\"php://stdin\"));"', @")<CR><Esc>]])
