local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')

vim.keymap.set('n', '<M-n>m', function() return harpoon_ui.toggle_quick_menu() end)
vim.keymap.set('n', '<M-n>n', function() return harpoon_mark.add_file() end)
vim.keymap.set('n', '<M-1>', function() return harpoon_ui.nav_file(1) end)
vim.keymap.set('n', '<M-2>', function() return harpoon_ui.nav_file(2) end)
vim.keymap.set('n', '<M-3>', function() return harpoon_ui.nav_file(3) end)
vim.keymap.set('n', '<M-4>', function() return harpoon_ui.nav_file(4) end)
vim.keymap.set('n', '<M-5>', function() return harpoon_ui.nav_file(5) end)
vim.keymap.set('n', '<M-6>', function() return harpoon_ui.nav_file(6) end)
vim.keymap.set('n', '<M-7>', function() return harpoon_ui.nav_file(7) end)
vim.keymap.set('n', '<M-8>', function() return harpoon_ui.nav_file(8) end)
vim.keymap.set('n', '<M-9>', function() return harpoon_ui.nav_file(9) end)
