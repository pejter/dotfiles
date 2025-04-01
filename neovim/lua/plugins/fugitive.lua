return {
	"tpope/vim-fugitive",
	dependencies = { "tpope/vim-rhubarb" },
	cmd = { "Git", "G", "Gw" },
	keys = {
		{ "<leader>gs", "<cmd>vertical Git<cr>", desc = "Status" },
		{ "<leader>gb", "<cmd>.GBrowse<cr>",     desc = "Browse (Open in browser)", mode = "n" },
		{ "<leader>gb", ":GBrowse<cr>",          desc = "Browse (Open in browser)", mode = "v" },
	},
}
