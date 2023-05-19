local telescope_action_layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    initial_mode = "insert",
    mappings = {
      n = {
        ["<M-/>"] = telescope_action_layout.toggle_preview,
      },
      i = {
        ["<M-/>"] = telescope_action_layout.toggle_preview,
      },
    },
    preview = {
      hide_on_startup = true,
      filesize_limit = 10,
      treesitter = true,
    },
  },
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
})
