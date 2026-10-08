vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/folke/snacks.nvim" },
}, { load = true })

---@type snacks.Config
require("snacks").setup({
	dashboard = {
		preset = {
			header = table.concat({
				"",
				"",
				"",
				"                                                                     ",
				"       ████ ██████           █████      ██                     ",
				"      ███████████             █████                             ",
				"      █████████ ███████████████████ ███   ███████████   ",
				"     █████████  ███    █████████████ █████ ██████████████   ",
				"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
				"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
				" ██████  █████████████████████ ████ █████ █████ ████ ██████",
				"",
			}, "\n"),
			keys = {
				{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.picker.pick('files')" },
				{ icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
				{ icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.picker.grep()" },
				{ icon = " ", key = "b", desc = "Buffers", action = ":lua Snacks.picker.buffers()" },
				{ icon = "󰙅 ", key = "e", desc = "Explorer", action = ":lua Snacks.explorer()" },
				{ icon = " ", key = "l", desc = "Lazygit", action = ":lua Snacks.lazygit()" },
				{ icon = " ", key = "L", desc = "Lazygit Log", action = ":lua Snacks.lazygit.log_file()" },
				{ icon = "📝", key = "s", desc = "Scratch Buffer", action = ":lua Snacks.scratch()" },
				{ icon = "📚", key = "S", desc = "Select Scratch", action = ":lua Snacks.scratch.select()" },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
		},
		sections = {
			{ section = "header" },
			{ section = "keys", gap = 1, padding = 1 },
		},
	},
})
