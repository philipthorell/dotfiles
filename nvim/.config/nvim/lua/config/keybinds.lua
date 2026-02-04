vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")

-- ZZ remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever (yank and paste without overwriting buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Navigate vim and tmux panes better
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")
