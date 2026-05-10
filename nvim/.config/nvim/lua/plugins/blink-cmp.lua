return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = { "BufReadPre", "BufNewFile", "CmdlineEnter" },
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = { preset = "enter" },
			appearance = { nerd_font_variant = "mono" },
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "rounded" },
				},
				menu = { border = "rounded" },
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "lazydev" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
		config = function(_, opts)
			require("blink.cmp").setup(opts)
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
		end,
	},
}
