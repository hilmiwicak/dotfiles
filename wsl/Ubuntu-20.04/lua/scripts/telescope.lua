local telescope_action_layout = require("telescope.actions.layout")
-- local telescope_action_state = require("telescope.actions.state")

require("telescope").setup({
	defaults = {
		initial_mode = "insert",
    mappings = {
      n = {
        ["<M-/>"] = telescope_action_layout.toggle_preview,
      },
      i = {
        ["<M-/>"] = telescope_action_layout.toggle_preview,
      }
    },
    preview = {
      hide_on_startup = true,
      filesize_limit = 10,
      treesitter = true,
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
