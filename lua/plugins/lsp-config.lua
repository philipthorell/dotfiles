return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
        -- LSPs
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"ts_ls",
        "tailwindcss",
        -- Linters & Formatters
        -- "eslint_d",
        -- "prettier",
        -- "ruff",
        -- "stylua",
			},
			automatic_installation = true,
		},
	},
}
