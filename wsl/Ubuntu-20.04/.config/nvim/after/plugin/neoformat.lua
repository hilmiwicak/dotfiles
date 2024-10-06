vim.g.neoformat_verbose = false
vim.g.neoformat_try_node_exe = true

vim.g.neoformat_python_autopep8 = {
	exe = "python3",
	args = { "-m", "autopep8" },
}

vim.g.neoformat_html_prettier = {
	exe = "prettier",
	args = { '--stdin-filepath "%:p"' },
  stdin = true,
  try_node_exe = true,
}

vim.g.neoformat_enabled_go = { "gofmt" }
vim.g.neoformat_enabled_html = { "prettier" }
vim.g.neoformat_enabled_lua = { "stylua" }
vim.g.neoformat_enabled_markdown = { "prettier" }
vim.g.neoformat_enabled_python = { "autopep8" }
vim.g.neoformat_enabled_sh = { "shfmt" }
vim.g.neoformat_enabled_yaml = { "prettier" }

-- keymap
vim.keymap.set("n", "<leader>lf", "<cmd>Neoformat<CR>")
vim.keymap.set("x", "<leader>lf", ":Neoformat<CR>")
