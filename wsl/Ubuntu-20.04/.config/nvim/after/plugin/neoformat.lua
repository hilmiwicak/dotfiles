vim.g.neoformat_python_autopep8 = {
  exe = "python3",
  args = { "-m", "autopep8" },
}

vim.g.neoformat_enabled_go = { "gofmt" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_markdown = { "prettier" }
vim.g.neoformat_enabled_python = { "autopep8" }
vim.g.neoformat_enabled_sh = { "shfmt" }
vim.g.neoformat_enabled_yaml = { "prettier" }

vim.g.neoformat_verbose = false

-- keymap
vim.keymap.set('n', '<leader>lf', '<cmd>Neoformat<CR>')
vim.keymap.set('x', '<leader>lf', ':Neoformat<CR>')
