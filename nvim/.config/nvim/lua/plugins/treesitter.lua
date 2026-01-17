return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "master",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"html",
				"python",
				"tsx",
				"markdown",
				"json",
				"bash",
				"yaml",
				"toml",
			},
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
			sync_install = false,
			ignore_install = {},
			modules = {},
		})
	end,
}
