return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "ruff" },
		}

		-- 1. Create a helper to find the config path
		local function get_eslint_config()
			local root = vim.fn.getcwd()
			local root_config = root .. "/eslint.config.js"
			local frontend_config = root .. "/frontend/eslint.config.js"

			if vim.loop.fs_stat(root_config) then
				return root_config
			end
			if vim.loop.fs_stat(frontend_config) then
				return frontend_config
			end
			return nil
		end

		-- 2. Configure the linter to use that specific config file path
		lint.linters.eslint_d.args = {
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
			"--config",
			function()
				return get_eslint_config() or "eslint.config.js"
			end, -- Fallback to default
		}

		-- Trigger linting on save or text change
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
			group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
			callback = function()
				if vim.bo.buftype == "" and vim.bo.modifiable then
					lint.try_lint()
				end
			end,
		})
	end,
}
