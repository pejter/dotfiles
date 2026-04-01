local languages = {
	-- Standard neovim config languages
	"lua",
	"vim",
	"vimdoc",
	"query",
	-- Tooling
	"bash",
	"make",
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
		require("nvim-treesitter").install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("treesitter.setup", {}),
			callback = function(args)
				local buf = args.buf
				local filetype = args.match

				-- check if a parser exists for the current language
				local language = vim.treesitter.language.get_lang(filetype) or filetype
				if not vim.treesitter.language.add(language) then
					return
				end

				-- replicate `fold = { enable = true }`
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

				-- replicate `highlight = { enable = true }`
				vim.treesitter.start(buf, language)

				-- replicate `indent = { enable = true }`
				vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
