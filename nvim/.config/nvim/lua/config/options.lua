vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.runtimepath:append("/opt/nvim/lib/nvim")

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	float = {
		border = "rounded",
		focusable = true,
	},
})

local border = "rounded" -- Options: "single", "double", "shadow", "rounded"

-- Override globally for LSP floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
