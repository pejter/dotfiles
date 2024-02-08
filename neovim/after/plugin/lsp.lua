local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
	lsp.buffer_autoformat()
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		-- "tsserver",
		"rust_analyzer",
		"dockerls",
		"docker_compose_language_service",
	},
	handlers = {
		lsp.default_setup,
	},
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	formatting = cmp_format,
	sources = {
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
	},
	mapping = cmp.mapping.preset.insert({
		-- start & confirm completion
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- scroll up and down the documentation window
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),   

		-- Tab completion
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

	})
})
