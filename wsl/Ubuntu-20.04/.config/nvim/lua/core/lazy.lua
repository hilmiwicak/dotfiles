-- lazy config

-- try these later
-- correct lsp definition or reference for telescope
--  https://old.reddit.com/r/neovim/comments/137lm2n/plugin_definitionorreferencesnvim/
-- https://github.com/ray-x/lsp_signature.nvim
-- https://github.com/mfussenegger/nvim-dap
--  https://www.reddit.com/r/neovim/comments/y7dvva/typescript_debugging_in_neovim_with_nvimdap/
-- https://github.com/adalessa/laravel.nvim
-- https://github.com/jose-elias-alvarez/typescript.nvim
-- https://github.com/bennypowers/nvim-regexplainer
-- https://old.reddit.com/r/neovim/comments/tfkxll/how_to_collaborate_code/
--  or https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/kevinhwang91/nvim-ufo

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	diff = {
		cmd = "diffview.nvim",
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"netrwPlugin",
			},
		},
	},

	-- vimscript plugins
	{ "github/copilot.vim" },
	{
		"mattn/emmet-vim",
		ft = { "html", "php", "xml" },
	},
	{
		"jwalton512/vim-blade",
		ft = { "blade", "php" },
	},
	{ "mhinz/vim-signify" },
	{ "sbdchd/neoformat", },

	-- lsp, completion, and snippets
	{ "neovim/nvim-lspconfig" },
	{
		"KostkaBrukowa/definition-or-references.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
		},
	},

	-- treesitter and related plugins (like autopairs and comments)
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"windwp/nvim-autopairs",
			"numToStr/Comment.nvim",
		},
		build = ":TSUpdate",
	},
	{ "windwp/nvim-autopairs", },
	{ "windwp/nvim-ts-autotag" },
	{ "numToStr/Comment.nvim", },

	-- themes
	{ "catppuccin/nvim", as = "catppuccin", lazy = false },

	-- telescope and extensions
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"ThePrimeagen/harpoon",
		},
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "ThePrimeagen/harpoon" },

	-- almost as important as lsp and treesitter
	-- list of formatters i've downloaded:
	--  - prettier
	--  - stylua
	--  - shfmt
	--  - autopep8
	{ "sindrets/diffview.nvim", },
	{ "niuiic/git-log.nvim", dependencies = { "niuiic/core.nvim", }, },
	-- {
	-- 	"phaazon/hop.nvim",
	-- 	config = function()
	-- 		require("plugin_config.hop")
	-- 	end,
	-- },
  { "ggandor/leap.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
      require("nvim-surround").setup()
		end,
	},
	{
		"echasnovski/mini.files",
    version = false,
	},
	{ "mbbill/undotree", },
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "tpope/vim-fugitive" },

	-- misc
	{
		"shortcuts/no-neck-pain.nvim",
		config = function()
			require("no-neck-pain").setup()
		end,
	},
	-- {
	--   "kyazdani42/nvim-web-devicons",
	--   config = function()
	--     require("nvim-web-devicons").setup()
	--   end,
	-- },
})
