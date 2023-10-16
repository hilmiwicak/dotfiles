require("oil").setup({
  delete_to_trash = false,
  trash_command = "trash-put",
  keymaps = {
    ["<M-?>"] = "actions.preview",
    ["<M-[>"] = "actions.open_cwd",
    ["<leader>oc"] = "actions.cd",
    ["<leader>ot"] = "actions.tcd",
    ["<C-p>"] = false,
  },
  view_options = {
    show_hidden = true,
  },
  float = {
    padding = 2,
    max_width = 70,
    max_height = 30,
    win_options = {
      winblend = 10,
    },
  },
})
