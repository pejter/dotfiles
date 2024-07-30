local wk = require("which-key")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-z>", vim.cmd.UndotreeToggle)
vim.keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<A-k>", ":move .-2<cr>")
vim.keymap.set("n", "<A-j>", ":move .+1<cr>")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<cr>gi")
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<cr>gi")
vim.keymap.set("v", "<A-k>", ":move '<-2<cr>gv")
vim.keymap.set("v", "<A-j>", ":move '>+1<cr>gv")

vim.keymap.set("i", "<C-CR>", "<Esc>o")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

wk.add({
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bf", vim.lsp.buf.format, desc = "Format" },
	{ "<leader>bq", "<cmd>bprevious <bar>bdelete #<cr>", desc = "Close" },

	{ "<leader>f", group = "File" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>ff", "<cmd>Telescope grep_string<cr>", desc = "Find (grep_string)" },
	{ "<leader>fl", "<cmd>Telescope file_browser<cr>", desc = "List" },
	{ "<leader>fo", "<cmd>Telescope find_files hidden=true<cr>", desc = "Open" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent" },
	{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search (live_grep)" },
	{ "<leader>fv", "<cmd>Neotree reveal<cr>", desc = "Reveal in sidebar" },

	{ "<leader>g", group = "Git" },
	{ "<leader>go", "<cmd>Telescope git_files<cr>", desc = "Open File" },
	{ "<leader>gs", "<cmd>vertical Git<cr>", desc = "Status" },

	{ "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Help" },
	{ "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>', desc = "Insert newline before" },
	{ "<leader>o", ':<C-u>call append(line(".") , repeat([""], v:count1))<cr>', desc = "Insert newline after" },
	{ "<leader>t", ":tabnew term://zsh<cr>", desc = "Terminal" },
	{ "<leader>x", "<Cmd>!chmod +x %<cr>", desc = "Set executable flag on current file" },
	{ "<leader>d", '"_d', desc = "Delete (without copying)", mode = { "n", "v" } },
	{ "<leader>y", '"+y', desc = "Yank to system clipboard", mode = { "n", "v" } },
	{ "<leader>p", '[["_dP]]', desc = "Paste (without replacing current register)" }, 
})

