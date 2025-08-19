return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Extensions
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-project.nvim",
		-- "nvim-telescope/telescope-frecency.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local telescopeConfig = require("telescope.config")
		local builtin = require("telescope.builtin")

		-- Clone the default Telescope configuration
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
		local project_actions = require("telescope._extensions.project.actions")

		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!**/.git/*")

		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			extensions = {
				project = {
					ignore_missing_dirs = true, -- default: false
					hidden_files = true, -- default: false
					theme = "dropdown",
					search_by = "title",
					-- sync_with_nvim_tree = true, -- default false
					on_project_selected = function(prompt_bufnr)
						-- Do anything you want in here. For example:
						project_actions.find_project_files(prompt_bufnr, true)
						-- require("harpoon.ui").nav_file(1)
					end,
				}
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("ui-select")
		telescope.load_extension("project")

		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "Help" })

		-- File group
		vim.keymap.set("n", "<leader>fl", telescope.extensions.file_browser.file_browser, { desc = "List" })
		vim.keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "Find (grep_string)" })
		vim.keymap.set("n", "<leader>fo", function() builtin.find_files({ hidden = true }) end, { desc = "Open" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Open Recent" })
		vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search (live_grep)" })
		vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Search (live_grep)" })

		-- Project group
		vim.keymap.set("n", "<leader>po", telescope.extensions.project.project, { desc = "Open" })
		vim.keymap.set("n", "<leader>ps", builtin.lsp_dynamic_workspace_symbols, { desc = "Symbols" })
		vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "Diagnostics" })

		-- Buffer group
		vim.keymap.set("n", "<leader>bl", builtin.buffers, { desc = "List" })

		-- Git group
		vim.keymap.set("n", "<leader>go", builtin.git_files, { desc = "Open file" })
	end,
}
