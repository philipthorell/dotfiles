vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
}, { load = true })

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true, -- Auto close on trailing </
	},
})
