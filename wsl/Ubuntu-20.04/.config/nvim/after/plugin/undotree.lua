vim.g.undotree_WindowLayout = 3

-- keymap
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', {silent = true})
vim.keymap.set('n', '<leader>U', '<cmd>UndotreeFocus<CR>', {silent = true})
