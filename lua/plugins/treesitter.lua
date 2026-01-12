return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.config")
		configs.setup({
			ensure_installed = {
				"lua",
				"javascript",
				"html",
				"python",
				"jsx",
				"tsx",
				"markdown",
				"json",
				"bash",
				"yaml",
				"toml",
			},
			highlight = { enabled = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
