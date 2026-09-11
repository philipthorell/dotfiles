vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.nvim", version = "stable" },

	-- LSP, completion, and formatting
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/rafamadriz/friendly-snippets",

	-- Syntax and editing
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },

	"https://github.com/tpope/vim-fugitive",
})

---- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup({ -- remove
	mappings = {
		go_in = "<CR>",
		go_in_plus = "L",
		go_out = "_",
		go_out_plus = "H",
	},
})
vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini files explorer" })
vim.keymap.set("n", "<leader>-", function()
	MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	MiniFiles.reveal_cwd()
end, { desc = "Toggle into currenty opened file" })

---- mini notify ----
require("mini.notify").setup({
	-- only show messages
	content = {
		format = function(notif)
			return notif.msg
		end,
	},
})

---- mini cmdlind completion ----
require("mini.cmdline").setup({
	autocorrect = { enable = false },
})

---- mini surround ----
require("mini.surround").setup()
-- Default keymaps
-- | 'sa' | Add surrounding
-- | 'sd' | Delete surrounding
-- | 'sr' | Replace surrounding
-- | 'sf' | Find surrounding (right)
-- | 'sF' | Find surrounding (left)
-- | 'sh' | Highlight surrounding
-- | 'sn' | Update n_lines
-- | 'l' / 'n' | as suffix for prev/next

---- mini picker ----
local MiniPick = require("mini.pick")
MiniPick.setup()

vim.keymaps.set("n", "<leader>pf", function()
	MiniPick.builtin.files()
end, { desc = "Mini File Picker" })
vim.keymaps.set("n", "<leader>ps", function()
	MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Mini Grep" })
vim.keymaps.set("n", "<leader>vh", function()
	MiniPick.builtin.help()
end, { desc = "Mini Help" })

---- mini extra ----
local MiniExtra = require("mini.extra")
MiniExtra.setup()

vim.keymap("n", "<leader>xx", function()
	MiniExtra.pickers.diagnostics()
end, { desc = "Mini Picker Diagnostics" })
vim.keymap("n", "<leader>pk", function()
	MiniExtra.pickers.keymaps()
end, { desc = "Search keymaps" })

---- mini completion ----
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
	lsp_completion = {
		auto_setup = true,
	},
})

---- mini snippets ----
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
	snippets = {
		MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets automatically
	},
	-- disable empty tabstop indicators
	-- expand = {
	-- 	insert = function(snippet)
	-- 		MiniSnippets.default_insert(snippet, { empty_tabstop = "" })
	-- 	end,
	-- },
})
MiniSnippets.start_lsp_server({ match = false })

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
-- 		vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
-- 		vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
-- 		vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
-- 		vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
-- 	end,
-- })

---- mini diff ----
local MiniDiff = require("mini.diff")
MiniDiff.setup({
	source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set("n", "[h", function()
	MiniDiff.goto_hunk("prev")
end, { desc = "Prev hunk" })
vim.keymap.set("n", "]h", function()
	MiniDiff.goto_hunk("next")
end, { desc = "Next hunk" })
-- gh : stage hunk
-- gH : reset hunk

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<CR>", { desc = "Fugitive Full Page New Tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gvdiffsplit<CR>", { desc = "Gitt diff split" })

---- mini jump ----
require("mini.jump").setup()
require("mini.pairs").setup()

---- nvim treesitter ----
require("pack-plugins.treesitter")

---- lsp ----
require("pack-plugins.lsp")
