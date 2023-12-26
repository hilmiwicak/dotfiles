-- some settings are put on lazy config
-- to prevent unpredicted lazy loading shenanigans

vim.g.copilot_filetypes = {
  harpoon = false,
  markdown = true,
  minifiles = false,
  TelescopePrompt = false,
  yaml = true,
}

-- keymap
vim.cmd('imap <silent><script><expr> <M-a>a copilot#Accept("<Tab>")')
vim.keymap.set('i', '<M-a>q', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<M-a>l', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-a>h', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<M-a>s', '<Plug>(copilot-suggest)')
vim.keymap.set('n', '<M-a>p', ':Copilot ')
vim.keymap.set('i', '<M-a>p', ':Copilot ')
