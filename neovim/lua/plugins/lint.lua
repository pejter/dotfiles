return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			bzl = { "buildifier" },
			go = { "golangcilint" },
			python = { "pylint" },
			rust = { "clippy" },
			terraform = { "tflint" },
			yaml = { "yamllint" },
			sql = { "sqlfluff", "eugene" },
			php = { "phpcs", "phpstan" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		local trylint = function()
			lint.try_lint()
		end

		vim.keymap.set("n", "<leader>bL", trylint, { desc = "Trigger linting for current file" })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = trylint,
		})
	end,
}
