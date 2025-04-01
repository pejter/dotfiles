return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({
					async = true,
					timeout_ms = 5000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
	opts = {
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
	}
}
