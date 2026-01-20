return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },

			python = { "ruff" },
		}
		-- Trigger linting on save or text change
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				-- Only run linting if we are in a normal, modifiable buffer
				if vim.bo.buftype == "" and vim.bo.modifiable then
					require("lint").try_lint()
				end
			end,
		})
	end,
}
