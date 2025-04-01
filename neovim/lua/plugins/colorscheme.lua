return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "macchiato",
			transparent_background = true,
			styles = {       -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
			},
		})

		-- turn on termguicolors for colorscheme to work
		-- (have to use iterm2 or any other true color terminal)
		vim.opt.termguicolors = true
		vim.opt.background = "dark" -- colorschemes that can be light or dark will be made dark

		vim.cmd.colorscheme("catppuccin")
	end,
}
