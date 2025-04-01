return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hijack_netrw_behavior = "open_default",
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enabled = true,
				},
			},
			window = {
				mappings = {
					["h"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" and node:is_expanded() then
							require "neo-tree.sources.filesystem".toggle_directory(state, node)
						else
							require "neo-tree.ui.renderer".focus_node(state, node:get_parent_id())
						end
					end,
					["l"] = function(state)
						local node = state.tree:get_node()
						if node.type == "directory" then
							if not node:is_expanded() then
								require "neo-tree.sources.filesystem".toggle_directory(state, node)
							elseif node:has_children() then
								require "neo-tree.ui.renderer".focus_node(state, node:get_child_ids()[1])
							end
						end
					end,
				}
			}
		})

		vim.keymap.set("n", "<leader>gl", "<cmd>Neotree float git_status<cr>", { desc = "List status" })
	end,
}
