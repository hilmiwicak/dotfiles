require"nvim-treesitter.configs".setup {
  parser_install_dir = "~/.config/nvim/parsers",
  ensure_installed = { "c", "dockerfile", "go", "javascript", "lua", "markdown", "php", "typescript", "yaml" },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
}
