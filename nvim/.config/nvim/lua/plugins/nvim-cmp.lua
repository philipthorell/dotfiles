return {
	{
		"hrsh7th/cmp-nvim-lsp",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "antosha417/nvim-lsp-file-operations", config = true }, -- If a file is renamed, change the imports of that file to the new name
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Enable autocompletion for every lsp
			local capabilities = cmp_nvim_lsp.default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered({
						border = "single",
					}),
					documentation = cmp.config.window.bordered({
						border = "single",
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
			-- Set configuration for specific filetype.
			--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]
			--

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			--	cmp.setup.cmdline({ "/", "?" }, {
			--		mapping = cmp.mapping.preset.cmdline(),
			--		sources = {
			--			{ name = "buffer" },
			--		},
			--	})

			--	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			--	cmp.setup.cmdline(":", {
			--		mapping = cmp.mapping.preset.cmdline(),
			--		sources = cmp.config.sources({
			--			{ name = "path" },
			--		}, {
			--			{ name = "cmdline" },
			--		}),
			--		matching = { disallow_symbol_nonprefix_matching = false },
			--	})

			-- Set up lspconfig.
			--			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			--			vim.lsp.config("<YOUR_LSP_SERVER>", {
			--				capabilities = capabilities,
			--			})
			--			vim.lsp.enable("<YOUR_LSP_SERVER>")
		end,
	},
}
