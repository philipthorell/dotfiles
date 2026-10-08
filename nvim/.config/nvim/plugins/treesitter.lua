vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
}, { load = true })

local parsers = {
	"lua",
	"vim",
	"vimdoc",
	"query",
	"javascript",
	"typescript",
	"tsx",
	"python",
	"go",
	"rust",
	"json",
	"yaml",
	"toml",
	"markdown",
	"html",
	"css",
	"bash",
	"dockerfile",
}

-- Install missing parsers on startup (non-blocking)
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		for _, lang in ipairs(parsers) do
			local ok = vim.treesitter.language.add(lang)
			if not ok then
				pcall(vim.treesitter.language.install, lang)
			end
		end
	end,
})

-- Enable highlighting and indentation per buffer
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start)
		local ft = vim.bo[args.buf].filetype
		if ft == "qml" or ft == "qmljs" then
			vim.bo[args.buf].indentexpr = ""
			vim.bo[args.buf].cindent = true
			vim.bo[args.buf].shiftwidth = 4
			vim.bo[args.buf].tabstop = 4
			vim.bo[args.buf].expandtab = true
		else
			vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
