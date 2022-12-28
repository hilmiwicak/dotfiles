require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

require("Comment").setup({
	toggler = {
		line = "gcc",
		block = "gcb",
	},
})

require("diffview").setup({
	win_config = {
		position = "right",
	},
})

require("hop").setup()

require("no-neck-pain").setup()

require("octo").setup()

require("plenary")

require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
		side = "right",
		mappings = {
			list = {
				{ key = "<M-]>", action = "cd" },
			},
		},
	},
	filters = {
		custom = { "^\\.git" },
	},
})

-- undotree
vim.g.undotree_WindowLayout = 3

require("nvim-web-devicons").setup({
	default = true,
})
