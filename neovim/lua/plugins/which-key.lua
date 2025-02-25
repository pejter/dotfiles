return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 5000
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({})
		wk.add({
			{ "<leader>b", group = "Buffer" },
			{ "<leader>f", group = "File" },
			{ "<leader>s", group = "Search" },
			{ "<leader>g", group = "Git" },
		})
	end,
}
