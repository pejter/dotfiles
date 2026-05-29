local languages = {
	-- Standard neovim config languages
	"lua",
	"vim",
	"vimdoc",
	"query",
	-- Tooling
	"bash",
	"make",
	"gitcommit",
	"git_rebase",
	"git_config",
	"gitignore",
	"gitattributes",
	-- Development
	"rust",
	"go",
	"javascript",
	"typescript",
}

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {
				opts = {
					enable_close_on_slash = true,
				},
			},
		},
	},
	config = function()
		-- replicate `ensure_installed`, runs asynchronously, skips existing languages
		local ts = require("nvim-treesitter")
		ts.install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter.setup", {}),
			desc = "Auto-install and configure treesitter",
			callback = function(event)
				local buf = event.buf
				local filetype = event.match

				-- check if a parser exists for the current language
				local lang = vim.treesitter.language.get_lang(filetype) or filetype
				if not vim.list_contains(ts.get_available(), lang) then
					return
				end

				if not vim.list_contains(ts.get_installed(), lang) and not vim.list_contains(languages, lang) then
					ts.install(lang, { summary = false }):wait()
				end

				-- replicate `highlight = { enable = true }`
				vim.treesitter.start(buf, lang)

				-- replicate `fold = { enable = true }`
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- replicate `indent = { enable = true }`
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
