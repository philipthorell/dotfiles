return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			-- Change 'guifg' to the hex code of the blue you want from your Alacritty config
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#61afef" }) -- The sign in the gutter
			vim.api.nvim_set_hl(0, "GitSignsChangeLn", { fg = "#61afef" }) -- The line highlight (if enabled)
			vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#61afef" }) -- The line number (if enabled)
		end,
	},
}
