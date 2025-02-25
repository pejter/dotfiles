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
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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
				-- { "<leader>bs", telescope.lsp_document_symbols, desc = "Symbols" },

				opts.desc = "Show buffer diagnostics"
				vim.keymap.set("n", "<leader>bd", function() telescope.diagnostics({bufnr=0}) end, opts)

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

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
		-- default handler for installed servers
		function(server_name)
			lspconfig[server_name].setup({
			capabilities = capabilities,
			})
		end,
		["lua_ls"] = function()
			-- configure lua server (with special settings)
			lspconfig["lua_ls"].setup({
			capabilities = capabilities,
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
		})
	end,
}
