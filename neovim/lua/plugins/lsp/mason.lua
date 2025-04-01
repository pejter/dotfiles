return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
			},
		})
	end,
}
