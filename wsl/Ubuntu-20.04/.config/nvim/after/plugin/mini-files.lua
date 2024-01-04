require("mini.files").setup({
  mappings = {
    go_in = "L",
    go_in_plus = "<CR>",
    go_out = "H",
    go_out_plus = "",
  },
})

-- keymap
vim.keymap.set('n', '<M-e>', '<cmd>lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<M-E>', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>')
