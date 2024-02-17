local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-z>", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>")

vim.keymap.set("n", "J", "mzJ`z`")
vim.keymap.set("n", "<A-k>", ":move .-2<cr>")
vim.keymap.set("n", "<A-j>", ":move .+1<cr>")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<cr>gi")
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<cr>gi")
vim.keymap.set("v", "<A-k>", ":move '<-2<cr>gv")
vim.keymap.set("v", "<A-j>", ":move '>+1<cr>gv")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")

wk.register({
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
	x = { "<Cmd>!chmod +x %<cr>", "Set executable flag on current file" }
}, { prefix = "<leader>" })

wk.register({
	p = { "\"_dP", "Paste (without replacing current register)" }
}, { prefix = "<leader>", mode = "x" })

