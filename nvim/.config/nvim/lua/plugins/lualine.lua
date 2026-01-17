return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_y = {
					{
						"diagnostics",
						sources = { "nvim_workspace_diagnostic" },
					},
				},
			},
		})
	end,
}
