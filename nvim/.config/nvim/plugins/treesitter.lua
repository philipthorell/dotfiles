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
}

-- Install missing parsers on startup (non-blocking)
vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		for _, lang in ipairs(parsers) do
			local ok = pcall(vim.treesitter.language.require_language, lang, nil, true)
			if not ok then
				pcall(vim.treesitter.language.install, lang)
			end
		end
	end,
})

-- Enable highlighting per buffer
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start) -- silently falls back to regex if no parser
	end,
})
