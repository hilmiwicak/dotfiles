require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
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

local telescope_action_layout = require("telescope.actions.layout")
require("telescope").setup({
	defaults = {
		initial_mode = "insert",
    mappings = {
      n = {
        ["?"] = telescope_action_layout.toggle_preview,
      }
    },
    preview = {
      filesize_limit = 10,
      treesitter = false,
      hide_on_startup = true
    }
	},
	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("ui-select")

require("nvim-tree").setup({
	view = {
		number = true,
		relativenumber = true,
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

require("nvim-web-devicons").setup({
	default = true,
})
