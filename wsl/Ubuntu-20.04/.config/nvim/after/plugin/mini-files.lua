require("mini.files").setup({
  mappings = {
    go_in_plus = "<CR>",
  },
})

-- keymap
vim.keymap.set('n', '<M-e>', '<cmd>lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<M-E>', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>')
