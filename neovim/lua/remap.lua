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

vim.keymap.set("i", "<C-CR>", "<Esc>o")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

wk.register({
	g = {
		name = "Git",
		s = { vim.cmd.Git, "Status" },
		o = { "<cmd>Telescope git_files<cr>", "Open File" },
	},
	f = {
		name = "File",
		l = { "<cmd>Telescope file_browser<cr>", "List" },
		o = { "<cmd>Telescope find_files hidden=true<cr>", "Open" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent" },
		f = { "<cmd>Telescope grep_string<cr>", "Find (grep_string)" },
		s = { "<cmd>Telescope live_grep<cr>", "Search (live_grep)" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		v = { "<cmd>Neotree reveal<cr>", "Reveal in sidebar"},
	},
	b = {
		name = "Buffer",
		q = { "<cmd>bprevious <bar>bdelete #<cr>", "Close" },
	},
	t = { ':tabnew term://zsh<cr>', "Terminal" },
	o = { ':<C-u>call append(line(".")  , repeat([""], v:count1))<cr>', "Insert newline after" },
	O = { ':<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>', "Insert newline before" },
	y = { [["+y]], "Yank to system clipboard", mode = { "n", "v" } },
	x = { "<Cmd>!chmod +x %<cr>", "Set executable flag on current file" },
	d = { [["_d]], "Delete (without copying)", mode = { "n", "v" } },
	h = { "<cmd>Telescope help_tags<cr>", "Help" },
}, { prefix = "<leader>" })

wk.register({
	p = { [["_dP]], "Paste (without replacing current register)" }
}, { prefix = "<leader>", mode = "x" })

