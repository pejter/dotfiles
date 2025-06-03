return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"onsails/lspkind.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ "nvim-dap-ui" },
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert"
			},
			formatting = {
				format = lspkind.cmp_format(),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				},
			}),
			mapping = cmp.mapping.preset.insert({
				-- start & confirm completion
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- scroll up and down the documentation window
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),

				-- Tab completion
				["<Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_next_item()
						else
							cmp.complete()
						end
					end,
				},
				["<S-Tab>"] = {
					c = function()
						if cmp.visible() then
							cmp.select_prev_item()
						else
							cmp.complete()
						end
					end,
				},
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" }
			}
		})

		-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" }
			}, {
				{ name = "cmdline" }
			}),
			matching = { disallow_symbol_nonprefix_matching = false }
		})
	end,
}
