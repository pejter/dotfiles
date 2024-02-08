local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	"folke/which-key.nvim",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, 
	{ "mbbill/undotree" }, 
	{ "tpope/vim-fugitive" }, 
	{ "mg979/vim-visual-multi" }, 

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },
}

local opts = {}

require("lazy").setup(plugins, opts)
