vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
}, { load = true })

-- helper function to use telescope on harpoon list.
-- change get_ivy to other themes if wanted
local function toggle_telescope(harpoon_files)
	local conf = require("telescope.config").values
	local themes = require("telescope.themes")

	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end
	local opts = themes.get_ivy({
		promt_title = "Working List",
	})

	require("telescope.pickers").new(opts, {
		finder = require("telescope.finders").new_table({
			results = file_paths,
		}),
		previewer = conf.file_previewer(opts),
		sorter = conf.generic_sorter(opts),
	}):find()
end

local harpoon = require("harpoon")

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>fl", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })
vim.keymap.set("n", "<C-p>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-n>", function()
	harpoon:list():next()
end)
