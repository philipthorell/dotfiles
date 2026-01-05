return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d").with({
					extra_args = { "--config", vim.fn.expand("~/.eslintrc.json") },
					-- Optional: This makes it only run if no local config is found
					condition = function(utils)
						return not utils.root_has_file({
							".eslintrc",
							".eslintrc.js",
							".eslintrc.json",
							".eslintrc.yaml",
							".eslintrc.yml",
							"package.json",
						})
					end,
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
