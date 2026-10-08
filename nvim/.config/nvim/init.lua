require("vim._core.ui2").enable({})

local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/plugins/*.lua", false, true)
table.sort(plugin_files)
for _, file in ipairs(plugin_files) do
	dofile(file)
end
