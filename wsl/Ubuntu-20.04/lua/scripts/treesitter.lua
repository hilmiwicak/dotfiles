require"nvim-treesitter.configs".setup {
  parser_install_dir = "~/.config/nvim/parsers",
  ensure_installed = { "c", "javascript", "lua", "markdown", "php", "typescript", },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}
