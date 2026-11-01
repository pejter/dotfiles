return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},
	ft = { "http" },
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("rest")

		vim.keymap.set("n", "<leader>rs", "<cmd>Rest run<cr>", { desc = "Send request" })
		vim.keymap.set("n", "<leader>ro", "<cmd>Rest open<cr>", { desc = "Open results" })
		vim.keymap.set("n", "<leader>rr", "<cmd>Rest last<cr>", { desc = "Re-run last" })
		vim.keymap.set("n", "<leader>rc", "<cmd>Rest cookies<cr>", { desc = "Edit cookies" })
		vim.keymap.set("n", "<leader>re", telescope.extensions.rest.select_env, { desc = "Select env" })
	end,
}
