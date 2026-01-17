vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")

-- ZZ remaps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever (yank and paste without overwriting buffer)
vim.keymap.set("x", "<leader>p", [["_dP]])


