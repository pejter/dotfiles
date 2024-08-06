local wk = require("which-key")
local telescope = require("telescope.builtin")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-z>", vim.cmd.UndotreeToggle)

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
	{ "<leader>bl", telescope.buffers, desc = "List" },
	{ "<leader>bd", telescope.diagnostics, desc = "Diagnostics" },
	{ "<leader>bs", telescope.lsp_document_symbols, desc = "Symbols" },
	{ "<leader>bq", "<cmd>bprevious <bar>bdelete #<cr>", desc = "Close" },

	{ "<leader>f", group = "File" },
	{ "<leader>fg", telescope.grep_string, desc = "Find (grep_string)" },
	{ "<leader>fl", telescope.file_browser, desc = "List" },
	{ "<leader>fo", function() telescope.find_files({ hidden=true }) end, desc = "Open" },
	{ "<leader>fr", telescope.oldfiles, desc = "Open Recent" },
	{ "<leader>fs", telescope.live_grep, desc = "Search (live_grep)" },
	{ "<leader>fv", "<cmd>Neotree reveal<cr>", desc = "Reveal in sidebar" },

	{ "<leader>s", group = "Search" },
	{ "<leader>ss", telescope.lsp_dynamic_workspace_symbols, desc = "Symbols" },

	{ "<leader>g", group = "Git" },
	{ "<leader>go", telescope.git_files, desc = "Open File" },
	{ "<leader>gs", "<cmd>vertical Git<cr>", desc = "Status" },
	{ "<leader>gb", '<cmd>.GBrowse<cr>', desc = "Browse (Open in browser)" },

	{ "<leader>h", telescope.help_tags, desc = "Help" },
	{ "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<cr>', desc = "Insert newline before" },
	{ "<leader>o", ':<C-u>call append(line(".") , repeat([""], v:count1))<cr>', desc = "Insert newline after" },
	{ "<leader>t", ":tabnew term://zsh<cr>", desc = "Terminal" },
	{ "<leader>%", ":let @+ = expand('%:')<cr>", desc = "Yank current filepath to clipboard" },
	{ "<leader>x", "<Cmd>!chmod +x %<cr>", desc = "Set executable flag on current file" },
	{ "<leader>d", '"_d', desc = "Delete (without copying)", mode = { "n", "v" } },
	{ "<leader>y", '"+y', desc = "Yank to system clipboard", mode = { "n", "v" } },
	{ "<leader>p", '[["_dP]]', desc = "Paste (without replacing current register)" }, 
})

