local nvim_tmux_nav = require("nvim-tmux-navigation")

nvim_tmux_nav.setup{
  disable_when_zoomed = true,
}

vim.keymap.set("n", "<C-h>", function() nvim_tmux_nav.NvimTmuxNavigateLeft() end)
vim.keymap.set("n", "<C-j>", function() nvim_tmux_nav.NvimTmuxNavigateDown() end)
vim.keymap.set("n", "<C-k>", function() nvim_tmux_nav.NvimTmuxNavigateUp() end)
vim.keymap.set("n", "<C-l>", function() nvim_tmux_nav.NvimTmuxNavigateRight() end)
