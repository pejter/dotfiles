require("neo-tree").setup({
	filesystem = {
		hijack_netrw_behavior = "open_default",
		filtered_items = {
			visible =  true,
		}
	}
})
