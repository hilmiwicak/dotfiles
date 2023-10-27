local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    initial_mode = "insert",
    mappings = {
      n = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = false,
        ["<C-x>"] = false,
        ["<M-?>"] = layout.toggle_preview,
        ["<M-K>"] = actions.preview_scrolling_up,
        ["<M-J>"] = actions.preview_scrolling_down,
      },
      i = {
        ["<C-s>"] = actions.select_vertical,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = false,
        ["<C-x>"] = false,
        ["<M-?>"] = layout.toggle_preview,
        ["<M-j>"] = actions.move_selection_next,
        ["<M-k>"] = actions.move_selection_previous,
        ["<M-K>"] = actions.preview_scrolling_up,
        ["<M-J>"] = actions.preview_scrolling_down,
      },
    },
    file_ignore_patterns = {
      ".git/",
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
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
