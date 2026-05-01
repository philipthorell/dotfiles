local function get_python_path()
	-- Check for an already activated venv
	if vim.env.VIRTUAL_ENV then
		return vim.env.VIRTUAL_ENV .. "/bin/python"
	end

	-- Check for an already activated conda environment
	if vim.env.CONDA_PREFIX then
		return vim.env.CONDA_PREFIX .. "/bin/python"
	end

	-- Check for an .venv folder in the project root directory
	local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
	if vim.fn.executable(venv_path) == 1 then
		return venv_path
	end

	-- Fallback - Use the system python path
	return vim.fn.exepath("python3") or "python"
end

return {
	settings = {
		python = {
			pythonPath = get_python_path(),
		},
	},
}
