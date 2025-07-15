return {
	"mason-org/mason.nvim",
	dependencies = {
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				"neovim/nvim-lspconfig",
			},
		},
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- JS/TS
				"typescript-language-server",
				"deno",
				-- Python
				"python-lsp-server",
				"isort",
				"black",
				"pylint",
				-- Go
				"goimports",
				"gopls",
				"golangci-lint",
				-- Rust
				"rust-analyzer",
				-- Docker
				"dockerfile-language-server",
				"docker-compose-language-service",
				-- Terraform
				"terraform-ls",
				"tflint",
				-- Bazel
				"starpls",
				"buildifier",
				-- Yaml
				"yamllint",
				-- Astro(LSP)
				"astro-language-server",
				-- Astro(Tailwind)
				"rustywind",
				-- Lua
				"lua-language-server",
				"stylua",
				-- SQL
				"sqlls",
				"sqlfluff",
				"eugene",
				"pgformatter",
				-- PHP
				"intelephense", -- LSP
				"phpcs",
				"phpcbf",
				"phpstan",
			},
		})
	end,
}
