-- vim.opt.guicursor = ""
vim.opt.shell = "/bin/sh"
vim.opt.list = true

-- line position
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- split to natural direction
vim.opt.splitbelow = true
vim.opt.splitright = true

-- indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = 'split'

vim.opt.scrolloff = 8

vim.opt.termguicolors = true

vim.opt.isfname:append("@-@")

vim.o.completeopt = 'menuone,noselect'

vim.opt.updatetime = 50

vim.opt.title = true

vim.opt.mousemodel = 'extend'
