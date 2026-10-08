vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
}, { load = true })

require("lualine").setup({
	options = {
		theme = "auto",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = {
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				padding = { left = 0, right = 1 },
			},
		},
		lualine_x = { "encoding", "fileformat" },
		lualine_y = {
			{
				"diagnostics",
				sources = { "nvim_workspace_diagnostic" },
			},
		},
		lualine_z = { "location" },
	},
})
