return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"artemave/workspace-diagnostics.nvim",
		},
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
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"pyright",
				"ts_ls",
				"tailwindcss",
				"dockerls",
				"docker_compose_language_service",
				"yamlls",
				"bashls",
			},
		},
	},
}
