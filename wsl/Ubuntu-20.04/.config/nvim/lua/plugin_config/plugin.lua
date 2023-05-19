-- lazy config

-- try these later
-- correct lsp definition or reference for telescope
--  https://old.reddit.com/r/neovim/comments/137lm2n/plugin_definitionorreferencesnvim/
-- https://github.com/adalessa/laravel.nvim
-- https://github.com/bennypowers/nvim-regexplainer
-- https://old.reddit.com/r/neovim/comments/tfkxll/how_to_collaborate_code/
-- https://github.com/willothy/flatten.nvim
-- https://github.com/kevinhwang91/nvim-ufo
-- https://github.com/stevearc/oil.nvim

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
	{
		"github/copilot.vim",
		init = function()
      require("plugin_config.copilot")
		end,
	},
	{
		"mattn/emmet-vim",
		ft = { "html", "php", "xml" },
		init = function()
      require("plugin_config.emmet")
		end,
	},
	{
		"jwalton512/vim-blade",
		ft = { "blade", "php" },
	},
	{ "mhinz/vim-signify" },

	-- lsp, completion, and snippets
	{ "neovim/nvim-lspconfig" },
	{
		"KostkaBrukowa/definition-or-references.nvim",
		config = function()
      require("plugin_config.definition-or-references")
		end,
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
		},
		build = ":TSUpdate",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
      require("plugin_config.autopairs")
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"numToStr/Comment.nvim",
		config = function()
      require("plugin_config.comment")
		end,
	},

  -- themes
	{ "catppuccin/nvim", as = "catppuccin", lazy = false },

  -- telescope and extensions
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
      "ThePrimeagen/harpoon",
		},
		config = function()
      require("plugin_config.telescope")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "ThePrimeagen/harpoon" },

  -- misc
	{
		"sindrets/diffview.nvim",
		config = function()
      require("plugin_config.diffview")
		end,
	},
	{
		"phaazon/hop.nvim",
		config = function()
      require("plugin_config.hop")
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "sbdchd/neoformat" },
	{
		"shortcuts/no-neck-pain.nvim",
		config = function()
			require("no-neck-pain").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		-- dependencies = {
		--   "kyazdani42/nvim-web-devicons",
		-- },
		config = function()
			require("plugin_config.nvim-tree")
		end,
	},
	{
		"mbbill/undotree",
		config = function()
      require("plugin_config.undotree")
		end,
	},
	-- {
	--   "kyazdani42/nvim-web-devicons",
	--   config = function()
	--     require("nvim-web-devicons").setup({
	--       override_by_extension = {
	--         ["txt"] = {
	--           icon = "",
	--           color = "#89e051",
	--           cterm_color = "113",
	--           name = "Txt",
	--         },
	--       },
	--     })
	--   end,
	-- },
	{ "tamton-aquib/zone.nvim" },
})
