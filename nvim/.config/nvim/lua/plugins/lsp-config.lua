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
			servers = {
				ts_ls = {
					on_attach = function(client, bufnr)
						require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
					end,
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
