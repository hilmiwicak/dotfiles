require("diffview").setup({})

require("octo").setup({})

require("plenary")

require("telescope").setup({
	defaults = {
		initial_mode = "normal",
	},
})
require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")

require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
	},
  filters = {
    custom = { "^\\.git" }
  }
})

require("nvim-tundra").setup({
    plugins = {
      lsp = true,
      treesitter = true,
      cmp = true,
      context = true,
      dbui = true,
      gitsigns = true,
      telescope = true,
    },
})

require("nvim-web-devicons").setup({
	default = true,
})
