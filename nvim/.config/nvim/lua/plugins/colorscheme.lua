return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	--{
	--	"folke/tokyonight.nvim",
	--	lazy = false, -- Load this during startup
	--	priority = 1000, -- Load this before other plugins
	--	opts = {},
	--	config = function()
	--		vim.cmd([[colorscheme tokyonight]])
	--	end,
	--},
	--{
	--	"eddyekofo94/gruvbox-flat.nvim",
	--	priority = 1000,
	--	enabled = true,
	--	config = function()
	--		vim.cmd([[colorscheme gruvbox-flat]])
	--	end,
	--},
}
