require("diffview").setup({
  file_panel = {
    win_config = {
      position = "right",
    },
  },
  use_icons = false,
})

-- keymap
vim.keymap.set('n', '<leader>do', ':DiffviewOpen ')
vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', '<leader>de', '<cmd>DiffviewToggleFiles<CR>')
