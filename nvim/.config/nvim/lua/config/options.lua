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
