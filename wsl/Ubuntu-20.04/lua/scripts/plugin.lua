require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require("Comment").setup({
	toggler = {
		line = "gcc",
		block = "gcb",
	},
})

require("diffview").setup({})

require("octo").setup({})

require("plenary")

require("telescope").setup({
	defaults = {
		initial_mode = "normal",
	},
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
})
require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")
--require("telescope").load_extension("fzf")

require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
	},
	filters = {
		custom = { "^\\.git" },
	},
})

require("nvim-web-devicons").setup({
	default = true,
})
