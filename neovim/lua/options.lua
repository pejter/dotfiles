-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1

-- Line numbers
vim.wo.number = true

-- Word wrap
vim.opt.wrap = false

-- No highlight during search
vim.opt.hlsearch = false

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = {
    space = "⋅",
    eol = "↴",
    tab = "▎_",
    -- tab = "|_>",
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
