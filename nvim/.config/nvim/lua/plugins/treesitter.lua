return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	main = "nvim-treesitter",
	opts = {},
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		local ensure_installed = {
			"lua",
			"python",
			"html",
			"css",
			"javascript",
			"tsx",
			"markdown",
			"json",
			"bash",
			"yaml",
			"toml",
		}
		local installed = require("nvim-treesitter.config").get_installed()
		local to_install = vim.iter(ensure_installed)
			:filter(function(parser)
				return not vim.tbl_contains(installed, parser)
			end)
			:totable()
		if #to_install > 0 then
			require("nvim-treesitter").install(to_install)
		end
	end,
}
