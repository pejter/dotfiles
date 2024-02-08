local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

wk.register({
	["<C-z>"] = { vim.cmd.UndotreeToggle, "Undo" },
	["<C-f>"] = { "<cmd>Telescope live_grep<cr>", "Find" },
	["<A-k>"] = { ":move -2<cr>", "Move up", mode = { "n", "i" } },
	["<A-j>"] = { ":move +1<cr>", "Move down", mode = { "n", "i" } },
	["<A-k>"] = { ":move '<-2<cr>gv", "Move up", mode = "v" },
	["<A-j>"] = { ":move '>+1<cr>gv", "Move down", mode = "v" },
})

wk.register({
	r = { "ry:%s/<C-r>r//gc<left><left><left>", "Replace", mode = "v" },
	p = {
		name = "Project",
		l = { "<cmd>Telescope file_browser<cr>", "List" },
		o = { "<cmd>Telescope find_files<cr>", "Open File" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, 
		f = { "<cmd>Telescope grep_string<cr>", "Find" }, 
	},
	g = {
		name = "Git",
		s = { vim.cmd.Git, "Status" },
		o = { "<cmd>Telescope git_files<cr>", "Open File" },
	},
}, { prefix = "<leader>" })
