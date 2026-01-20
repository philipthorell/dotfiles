return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Run ruff_fix then ruff_format sequentially
				python = { "ruff_fix", "ruff_format" },

				-- Example for other languages
				lua = { "stylua" },

				-- JS/TS: Runs eslint_d followed by prettier
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
			},

			-- Optional: Setup format on save
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback", -- Use LSP if no formatter is found
			},
		})
	end,
}
