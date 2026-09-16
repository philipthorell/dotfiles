vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})

require("mason").setup()

-- default keymaps
-- vim.keymaps.set("n", "gri", vim.lsp.buf.implementation, opts)                -- Go to implementation
-- vim.keymaps.set("n", "grt", vim.lsp.buf.type_definition, opts)               -- Go to type definition
-- vim.keymaps.set("n", "grr", vim.lsp.buf.references, opts)                    -- Find references
-- vim.keymaps.set("n", "grn", vim.lsp.buf.rename, opts)                        -- Rename
-- vim.keymaps.set({ "n", "v" }, "gra", vim.lsp.buf.code_action, opts)          -- Code Action
-- vim.keymaps.set("n", "grx", vim.lsp.codelens.run, opts)                      -- Run CodeLens
-- vim.keymaps.set("n", "gO", vim.lsp.buf.document_symbol, opts)                -- Document symbols
-- vim.keymaps.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)              -- Signature help
-- vim.keymaps.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts)   -- Show documentation
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format local buffer" })
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"ts_ls",
		"html",
		"cssls",
		"tailwindls",
		"bashls",
		"dockerls",
		"docker_compose_language_service",
		"jsonls",
		"yamlls",
	},
})

vim.diagnostic.config({
	virtual_text = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"ts_ls",
	"html",
	"cssls",
	"tailwindls",
	"bashls",
	"dockerls",
	"docker_compose_language_service",
	"jsonls",
	"yamlls",
})
