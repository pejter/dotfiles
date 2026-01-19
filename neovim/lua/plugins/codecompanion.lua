return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",

		-- Adapters
		"github/copilot.vim",

		-- Extensions
		"ravitemer/mcphub.nvim",
	},
	opts = {
		interactions = {
			chat = {
				adapter = {
					name = "copilot",
					model = "claude-opus-4.5",
				},
			},
		},
		adapters = {
			http = {
				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-sonnet-4.5",
							},
						},
					})
				end,
			},
		},
	},
	init = function()
		vim.cmd.cabbrev("cc CodeCompanion")
	end,
	keys = {
		{
			"<leader>ca",
			"<cmd>CodeCompanionActions<cr>",
			mode = { "n", "v" },
			desc = "Actions",
		},
		{
			"<leader>cc",
			"<cmd>CodeCompanionChat Toggle<cr>",
			mode = { "n", "v" },
			desc = "Toggle Chat",
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			mode = "v",
			desc = "Add to buffer",
		},
	},
}
