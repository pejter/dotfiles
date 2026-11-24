local function browse_file()
	local path = vim.api.nvim_buf_get_name(0)
	local root = vim.fs.root(path, ".git")
	if not root then
		vim.notify("Cannot browse file outside a Git repository", vim.log.levels.ERROR)
		return
	end

	local result = vim.system({
		"gh",
		"browse",
		vim.fs.relpath(root, path) .. ":" .. vim.fn.line("."),
	}, { cwd = root, text = true }):wait()
	if result.code ~= 0 then
		vim.notify("gh browse failed: " .. vim.trim(result.stderr), vim.log.levels.ERROR)
	end
end

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signcolumn = true,
	},
	keys = {
		{
			"<leader>gB",
			browse_file,
			mode = { "n", "v" },
			desc = "Browse file",
		},
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk()
			end,
			mode = "n",
			desc = "Stage hunk",
		},
		{
			"<leader>gs",
			function()
				require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			mode = "v",
			desc = "Stage hunk",
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk()
			end,
			mode = "n",
			desc = "Reset hunk",
		},
		{
			"<leader>gr",
			function()
				require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end,
			mode = "v",
			desc = "Reset hunk",
		},
		{
			"<leader>gS",
			function()
				require("gitsigns").stage_buffer()
			end,
			desc = "Stage buffer",
		},
		{
			"<leader>gR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "Reset buffer",
		},
		{
			"<leader>gp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview hunk",
		},
		{
			"<leader>gi",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview hunk inline",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame_line({ full = true })
			end,
			desc = "Blame line",
		},
		{
			"<leader>gd",
			function()
				require("gitsigns").diffthis()
			end,
			desc = "Diff file",
		},
		{
			"<leader>gD",
			function()
				require("gitsigns").diffthis("~")
			end,
			desc = "Diff with parent",
		},
		{
			"<leader>gQ",
			function()
				require("gitsigns").setqflist("all")
			end,
			desc = "Send all changes to quickfix",
		},
		{
			"<leader>gq",
			function()
				require("gitsigns").setqflist()
			end,
			desc = "Send hunks to quickfix",
		},
	},
}
