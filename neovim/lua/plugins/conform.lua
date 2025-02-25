return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				bzl = { "buildifier" },
				go = { "goimports", "gofmt" },
				python = { "isort", "black" },
				rust = { "rustfmt" },
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = {
				timeout_ms = 1000
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>bf", function()
			conform.format({
				timeout_ms = 5000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
