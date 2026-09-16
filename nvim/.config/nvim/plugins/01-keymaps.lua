vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set({ "n", "v" }, "<leader>", "<nop>")

-- Replaces selected text WITHOUT losing what you yanked
vim.keymap.set("x", "p", [["_dP]], { desc = "Paste over selection without losing yanked text" })

-- Delete text without saving it to any register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Clears the highlighting of searched words
vim.keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlighting", silent = true })

-- Moves lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })

-- Indentation of lines
vim.keymap.set("v", "<", "<gv", { desc = "Unindent and keep selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent and keep selection" })

-- Keep the cursor where it is when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Centeres the cursor when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })

-- Centeres the cursor when going to the next searched word
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result with cursor centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result with cursor centered" })

-- Replace words globally
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word under the cursor globally" }
)
vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>", { desc = "Makes the file executable", silent = true })

vim.keymap.set("n", "<leader>re", "<cmd>restart<cr>", { desc = "Restart Neovim (:restart)" })

-- Show undotree
vim.keymap.set("n", "<leader>u", function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end, { desc = "Toggle Undotree" })
