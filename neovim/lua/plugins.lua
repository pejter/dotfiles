local plugins = {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	"folke/which-key.nvim",
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-file-browser.nvim", dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } },
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim", } },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" }, 

	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" }, 
	{ "tpope/vim-surround" },
	{ "mg979/vim-visual-multi" }, 
	{ "m4xshen/autoclose.nvim" },
	{ 'numToStr/Comment.nvim' },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "neovim/nvim-lspconfig" },
	{ "onsails/lspkind.nvim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
