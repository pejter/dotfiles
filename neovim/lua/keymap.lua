vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<C-z>", vim.cmd.UndotreeToggle)

-- Merge lines
vim.keymap.set("n", "J", "mzJ`z")

-- Move text up & down
vim.keymap.set("n", "<A-k>", ":move .-2<cr>")
vim.keymap.set("n", "<A-j>", ":move .+1<cr>")
vim.keymap.set("i", "<A-k>", "<Esc>:move .-2<cr>gi")
vim.keymap.set("i", "<A-j>", "<Esc>:move .+1<cr>gi")
vim.keymap.set("v", "<A-k>", ":move '<-2<cr>gv")
vim.keymap.set("v", "<A-j>", ":move '>+1<cr>gv")

-- Newline in the middle of line
vim.keymap.set("i", "<C-CR>", "<Esc>o")

-- Exit terminal insert mode with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Normal mode" })
vim.keymap.set("n", "<leader>t", ":tabnew term://zsh<cr>", { desc = "Terminal" })

-- Diagnostics
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Buffer
vim.keymap.set("n", "<leader>bq", "<cmd>bprevious <bar>bdelete #<cr>", { desc = "Close" })

-- Misc
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete (without copying)" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>%", ":let @+ = expand('%:')<cr>", { desc = "Yank current filepath to clipboard" })
vim.keymap.set("n", "<leader>q", "<cmd>cclose<cr>", { desc = "Close quickfix window" })
