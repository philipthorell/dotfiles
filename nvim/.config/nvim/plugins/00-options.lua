vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false
vim.opt.smartindent = true
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.laststatus = 3

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.completeopt = "menu,menuone,noselect,fuzzy,nosort" -- is for mini completions
vim.opt.shortmess:append("c") -- also for mini completions
--vim.opt.guicursor = ""  -- Let's the terminal control the look of the cursor
vim.opt.scrolloff = 8

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLine", { fg = "none", bg = "#2a2b3d", blend = 0 })

vim.opt.colorcolumn = "0"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.fillchars = { eob = " " }
