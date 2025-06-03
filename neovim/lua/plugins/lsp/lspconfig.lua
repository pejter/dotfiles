return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
		{
			"antosha417/nvim-lsp-file-operations",
			dependencies = {
				"nvim-lua/plenary.nvim",
				-- Uncomment whichever supported plugin(s) you use
				-- "nvim-tree/nvim-tree.lua",
				"nvim-neo-tree/neo-tree.nvim",
			},
			config = true
		},
	},
	config = function()
		-- Remove default mappings
		vim.keymap.del("n", "grr")      -- References
		vim.keymap.del("n", "gri")      -- Implementation
		vim.keymap.del("n", "gO")       -- Document symbols
		vim.keymap.del("n", "grn")      -- Rename
		vim.keymap.del({ "n", "x" }, "gra") -- Code actions
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				local opts = { buffer = ev.buf, silent = true }

				local telescope = require("telescope.builtin")

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Go to declaration"
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show signature"
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)

				opts.desc = "Show LSP references"
				vim.keymap.set("n", "gr", telescope.lsp_references, opts)
				-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				opts.desc = "Show LSP definitions"
				vim.keymap.set("n", "gd", telescope.lsp_definitions, opts)
				-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Show LSP implementations"
				vim.keymap.set("n", "gi", telescope.lsp_implementations, opts)
				-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

				opts.desc = "Show LSP type definitions"
				vim.keymap.set("n", "gt", telescope.lsp_type_definitions, opts)
				-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

				opts.desc = "Show LSP buffer symbols"
				vim.keymap.set("n", "<leader>bs", telescope.lsp_document_symbols, opts)

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>bd", function() telescope.diagnostics({ bufnr = 0 }) end, opts)

				opts.desc = "Show line diagnostics"
				vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Smart rename"
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

				opts.desc = "See available code actions"
				vim.keymap.set({ "n", "v" }, "<F4>", vim.lsp.buf.code_action, opts)

				opts.desc = "Show documentation for what is under cursor"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			end,
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = "󰠠 ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
		})

		vim.lsp.config('lua_ls', {
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
}
