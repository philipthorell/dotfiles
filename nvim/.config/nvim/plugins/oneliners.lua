vim.pack.add({
	-- This helps with ssh tunneling and copying to clipboard
	"https://github.com/ojroques/vim-oscyank",
	-- Show CSS Colors
	"https://github.com/brenoprata10/nvim-highlight-colors",
}, { load = true })

require("nvim-highlight-colors").setup({})
