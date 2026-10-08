vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/antosha417/nvim-lsp-file-operations" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2") },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
}, { load = true })

require("lazydev").setup()
require("lsp-file-operations").setup()
require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require("blink.cmp")
cmp.setup({
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
})
