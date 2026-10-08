vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/ajbucci/ipynb.nvim" },
}, { load = true })

require("ipynb").setup()
