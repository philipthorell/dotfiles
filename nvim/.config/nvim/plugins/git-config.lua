vim.pack.add({
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/lewis6991/gitsigns.nvim",
}, { load = true })

require("gitsigns").setup()

vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>fb", ":Gitsigns blame<CR>")
-- Change 'guifg' to the hex code of the blue you want from your Alacritty config
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#61afef" }) -- The sign in the gutter
vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = "#61afef" }) -- The line highlight (if enabled)
vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#61afef" }) -- The line number (if enabled)
