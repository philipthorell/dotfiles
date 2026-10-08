vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
}, { load = true })

vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Open lazy git" })
