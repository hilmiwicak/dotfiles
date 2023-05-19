local tel = require('telescope')
local tel_builtin = require('telescope.builtin')
local tel_custom = require('plugin_config.custom.telescope')
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')
local hop = require('hop')
local directions = require('hop.hint').HintDirection

vim.keymap.set('n', '<leader>do', ':DiffviewOpen ')
vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<CR>')
vim.keymap.set('n', '<leader>de', '<cmd>DiffviewToggleFiles<CR>')

vim.keymap.set('', '<M-]>', require("definition-or-references").definition_or_references, { silent = true })
-- vim.keymap.set('n', '<leader>lr', function() return tel_builtin.lsp_references() end)
vim.keymap.set('n', '<leader>ln', function() return vim.lsp.buf.rename() end)
vim.keymap.set('n', '<leader>ll', function() return vim.lsp.buf.hover() end)
vim.keymap.set('n', '<leader>lc', function() return vim.lsp.buf.code_action() end)
vim.keymap.set('n', '<M-t>', function() return tel_builtin.lsp_document_symbols() end)
vim.keymap.set('n', '<leader>le', function() return vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>lh', function() return tel_builtin.diagnostics({bufnr = 0}) end)
vim.keymap.set('n', '<leader>la', function() return tel_builtin.diagnostics({root_dir = true, no_unlisted=true}) end)

vim.keymap.set('', '<M-p>', function() return tel_custom.find({no_ignore = false}) end)
vim.keymap.set('', '<M-P>', function() return tel_custom.find({hidden = true, no_ignore = true}) end)
vim.keymap.set('', '<C-f>', function() return tel.extensions.live_grep_args.live_grep_args() end)
vim.keymap.set('n', '<M-b>', function() return tel_custom.buffers() end)
vim.keymap.set('n', '<leader>to', function() return tel_builtin.oldfiles() end)
vim.keymap.set('n', '<leader>th', function() return tel_builtin.help_tags() end)

vim.keymap.set('', '<M-n>m', function() return harpoon_ui.toggle_quick_menu() end)
vim.keymap.set('', '<M-n>n', function() return harpoon_mark.add_file() end)
vim.keymap.set('', '<M-1>', function() return harpoon_ui.nav_file(1) end)
vim.keymap.set('', '<M-2>', function() return harpoon_ui.nav_file(2) end)
vim.keymap.set('', '<M-3>', function() return harpoon_ui.nav_file(3) end)
vim.keymap.set('', '<M-4>', function() return harpoon_ui.nav_file(4) end)
vim.keymap.set('', '<M-5>', function() return harpoon_ui.nav_file(5) end)
vim.keymap.set('', '<M-6>', function() return harpoon_ui.nav_file(6) end)
vim.keymap.set('', '<M-7>', function() return harpoon_ui.nav_file(7) end)
vim.keymap.set('', '<M-8>', function() return harpoon_ui.nav_file(8) end)

vim.keymap.set('', '<M-f>', '<cmd>HopWordMW<CR>')
vim.keymap.set('', '<M-F>', '<cmd>HopChar1MW<CR>')

vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

vim.keymap.set('n', '<leader>zi', '<cmd>IndentBlanklineToggle<CR>')

-- vim.g.user_emmet_leader_key = '<M-m>'
-- local user_emmet_settings = {
--   [ 'php' ] = {
--     [ 'extends' ] = 'html',
--     [ 'filters' ] = 'c',
--   },
--   [ 'xml' ] = {
--     [ 'extends' ] = 'html',
--   },
-- }
-- vim.g.user_emmet_settings = user_emmet_settings

vim.keymap.set('', '<M-E>', '<cmd>NvimTreeOpen %:p:h<CR>', {silent = true})
vim.keymap.set('', '<M-e>e', '<cmd>NvimTreeToggle<CR>', {silent = true})
vim.keymap.set('', '<M-e>f', '<cmd>NvimTreeFindFile<CR>', {silent = true})

vim.cmd([[
  imap <silent><script><expr> <M-i>i copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true
]])
vim.keymap.set('i', '<M-i>q', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<M-i>l', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-i>h', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<M-i>s', '<Plug>(copilot-suggest)')
vim.keymap.set({'n', 'i'}, '<M-i>p', '<cmd>Copilot panel<CR>')

vim.keymap.set('n', '<leader>zn', '<cmd>NoNeckPain<CR>', {silent = true})

vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', {silent = true})
vim.keymap.set('n', '<leader>U', '<cmd>UndotreeFocus<CR>', {silent = true})

vim.keymap.set('i', '<M-w>', "", {remap = true})
vim.keymap.set({'n', 'v', 'c', 's', 'i', 'o', 'l', 't'}, '<M-;>', "", {remap = true})

vim.keymap.set('i', '<M-o>', "", {remap = true})
vim.keymap.set('n', '<M-o>', "", {remap = true})

vim.keymap.set('i', '<M-W>', "<Esc>lce", {remap = true})
vim.keymap.set('n', '<M-j>', "", {remap = true})
vim.keymap.set('n', '<M-k>', "", {remap = true})
vim.keymap.set('x', '<M-j>', ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('x', '<M-k>', ":m '<-2<CR>gv=gv", {silent = true})
vim.keymap.set('n', '<M-K>', "V:t '><CR>gv=gv", {silent = true})
vim.keymap.set('n', '<M-J>', "V:t '<-1<CR>gv=gv", {silent = true})

vim.keymap.set('x', '<M-K>', ":t '><CR>gv=gv", {silent = true})
vim.keymap.set('x', '<M-J>', ":t '<-1<CR>gv=gv", {silent = true})
vim.keymap.set('n', '<M-,>', 'gT')
vim.keymap.set('n', '<M-.>', 'gt')
vim.keymap.set('n', '<M-<>', '<cmd>tabm -<CR>', {silent = true})
vim.keymap.set('n', '<M->>', '<cmd>tabm +<CR>', {silent = true})
vim.keymap.set('n', '<M-x>', '<cmd>+tabc<CR>', {silent = true})

vim.keymap.set('n', '<leader>p',  '"+p')
vim.keymap.set('n', '<leader>P',  '"+P')
vim.keymap.set('i', '<M-p>',  'P')
vim.keymap.set('i', '<M-P>',  'hPa')
vim.keymap.set('x', '<leader>/s', ':g/\\%V')

vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('i', '<M-u>', 'u')
vim.keymap.set('i', '<M-U>', '<C-r>')
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
vim.keymap.set('n', 'cc', '"_cc')
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('n', 's', '"_s')
vim.keymap.set('n', 'S', '"_S')
vim.keymap.set('x', 'c', '"_c')
vim.keymap.set('x', 'C', '"_C')
vim.keymap.set('x', 'd', '"_d')
vim.keymap.set('x', 'D', '"_D')
vim.keymap.set('x', 's', '"_s')
vim.keymap.set('x', 'S', '"_S')
vim.keymap.set('n', 'K', '<C-u>', {remap = true})
vim.keymap.set('v', 'K', '<C-u>', {remap = true})
vim.keymap.set('n', 'J', '<C-d>', {remap = true})
vim.keymap.set('v', 'J', '<C-d>', {remap = true})
vim.keymap.set('x', 'Y', '"+y', {remap = true})
vim.keymap.set('x', 'X', '"+ygvd', {remap = true})
vim.keymap.set('', '?', '<cmd>nohl<CR>', {remap = true})

vim.keymap.set('', '<M-[>', '')
vim.keymap.set('', '<M-{>', ':bp<CR>', {silent = true})
vim.keymap.set('', '<M-}>', ':bn<CR>', {silent = true})
vim.keymap.set('', '<leader><leader>', '@q')
vim.keymap.set('', '<leader>ss', ':s/\\%V')
