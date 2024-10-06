-- lazy config

-- TODO
--
-- make a script that asks do you want to load copilot before all plugins
--
-- try these later
-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/folke/trouble.nvim
--  https://www.reddit.com/r/neovim/comments/y7dvva/typescript_debugging_in_neovim_with_nvimdap/
-- https://github.com/leath-dub/snipe.nvim
-- https://github.com/adalessa/laravel.nvim
-- https://github.com/jose-elias-alvarez/typescript.nvim
-- https://github.com/bennypowers/nvim-regexplainer
-- https://old.reddit.com/r/neovim/comments/tfkxll/how_to_collaborate_code/
-- https://github.com/kevinhwang91/nvim-ufo
-- https://github.com/NeogitOrg/neogit

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
		cache = {
			enabled = false,
		},
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
       vim.g.copilot_no_tab_map = true
       vim.g.copilot_assume_mapped = true
  	end,
  },

	{
		"mattn/emmet-vim",
		ft = { "html", "php", "xml" },
	},
	{
		"jwalton512/vim-blade",
		ft = { "blade", "php" },
	},
	{ "sbdchd/neoformat" },

	-- lsp, completion, and snippets
	{ "neovim/nvim-lspconfig" },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("lsp_signature").setup({
  --       bind = true,
  --       hint_enable = false,
  --       log_path = vim.fn.stdpath('cache') .. 'lsp_signature.log',
  --     })
  --   end,
  -- },
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
		version = "v2.*",
		build = "make install_jsregexp",
	},

	-- treesitter and related plugins (like autopairs and comments)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "windwp/nvim-autopairs", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "numToStr/Comment.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },

	-- themes
	{ "catppuccin/nvim", as = "catppuccin", lazy = false },

	-- telescope and extensions
  -- { "nvim-tree/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
      -- "nvim-tree/nvim-web-devicons",
		},
	},
	{
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
	{
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
	{
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },
	{
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

	-- almost as important as lsp and treesitter
	-- list of formatters i've downloaded:
  --  - gofmt
  --  - stylua
	--  - prettier
  --  - autopep8
	--  - shfmt
  { "alexghergh/nvim-tmux-navigation" },
	{ "sindrets/diffview.nvim" },
	{ "tpope/vim-fugitive" },
	{ "mbbill/undotree" },
	{ "niuiic/git-log.nvim", dependencies = { "niuiic/core.nvim" } },
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
  { "LunarVim/bigfile.nvim" },
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
})
