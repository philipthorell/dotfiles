local keymap = vim.keymap -- for conciseness

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }
		keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
		keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
		keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)
	end,
})

keymap.set({ "n", "v" }, "<leader>gf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file or range (Conform)" })

local severity = vim.diagnostic.severity
vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	float = {
		border = "rounded",
		focusable = true,
	},
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰌵 ",
			[severity.INFO] = "󰋼 ",
		},
	},
})
