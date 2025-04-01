-- Open vsplit to the right
vim.opt.splitright = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Word wrap
vim.opt.wrap = false

-- No highlight during search
vim.opt.hlsearch = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

vim.opt.signcolumn = "yes"

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = {
	space = "⋅",
	eol = "↴",
	tab = "▏_",
	trail = "•",
	extends = "❯",
	precedes = "❮",
	nbsp = "",
}
vim.opt.fillchars = {
	fold = " ",
	foldsep = " ",
	foldopen = "",
	foldclose = "",
	diff = "╱",
}
