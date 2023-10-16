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

vim.keymap.set('n', '<leader>dl', '<cmd>lua require("git-log").check_log()<CR>')
vim.keymap.set('x', '<leader>dl', ':lua require("git-log").check_log()<CR>')

vim.keymap.set('', '<M-]>', require("definition-or-references").definition_or_references, { silent = true })
vim.keymap.set('n', '<leader>lr', function() return tel_builtin.lsp_definitions() end)
vim.keymap.set('n', '<leader>lR', function() return tel_builtin.lsp_references() end)
vim.keymap.set('n', '<leader>ln', function() return vim.lsp.buf.rename() end)
vim.keymap.set('n', '<M-h>s', function() return vim.lsp.buf.signature_help() end)
vim.keymap.set('n', '<M-h>h', function() return vim.lsp.buf.hover() end)
vim.keymap.set('i', '<M-h>s', ':lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('i', '<M-h>h', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>lc', function() return vim.lsp.buf.code_action() end)
vim.keymap.set('n', '<M-t>', function() return tel_builtin.lsp_document_symbols() end)
vim.keymap.set('n', '<leader>le', function() return vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>lh', function() return tel_builtin.diagnostics({bufnr = 0}) end)
vim.keymap.set('n', '<leader>la', function() return tel_builtin.diagnostics({root_dir = true, no_unlisted=true}) end)

vim.keymap.set('n', '<M-p>', function() return tel_custom.find({}) end)
vim.keymap.set('n', '<M-P>', function() return tel_custom.find({hidden = true, no_ignore = true}) end)
vim.keymap.set('n', '<C-f>', function() return tel.extensions.live_grep_args.live_grep_args() end)
vim.keymap.set('n', '<M-b>', function() return tel_custom.buffers({}) end)
vim.keymap.set('n', '<leader>to', function() return tel_builtin.oldfiles() end)
vim.keymap.set('n', '<leader>th', function() return tel_builtin.help_tags() end)

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

-- set keymap for oil.nvim
-- some other keymaps are in plugin_config.oil
-- vim.keymap.set('n', '<M-e>', function() return require('oil').toggle_float() end)
-- vim.keymap.set('n', '<M-E>', ':lua require("oil").open_float()')

-- set keymap for MiniFiles.nvim
vim.keymap.set('n', '<M-e>', '<cmd>lua MiniFiles.open()<CR>')
vim.keymap.set('n', '<M-E>', '<cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>')

vim.cmd('imap <silent><script><expr> <M-a>a copilot#Accept("<CR>")')
vim.keymap.set('i', '<M-a>q', '<Plug>(copilot-dismiss)')
vim.keymap.set('i', '<M-a>l', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-a>h', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<M-a>s', '<Plug>(copilot-suggest)')
vim.keymap.set('n', '<M-a>p', ':Copilot ')
vim.keymap.set('i', '<M-a>p', ':Copilot ')

vim.keymap.set('n', '<leader>z=', '<cmd>NoNeckPain<CR>', {silent = true})

vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>:UndotreeFocus<CR>', {silent = true})
vim.keymap.set('n', '<leader>U', '<cmd>UndotreeFocus<CR>', {silent = true})

vim.keymap.set({'i', 'c'}, '<M-w>', "", {remap = true})
vim.keymap.set({'i', 'c'}, '<M-d>', "de", {remap = true})
vim.keymap.set({'n', 'v', 'c', 's', 'i', 'o', 'l', 't'}, '<M-;>', "", {remap = true})

vim.keymap.set({'n', 'i'}, '<M-o>', "", {remap = true})
vim.keymap.set('n', '<M-i>', "	", {remap = true})

vim.keymap.set('n', '<M-j>', "", {remap = true})
vim.keymap.set('i', '<M-j>', "", {remap = true})
vim.keymap.set('n', '<M-k>', "", {remap = true})
vim.keymap.set('i', '<M-k>', "", {remap = true})
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

-- search within selection
vim.keymap.set('x', '<leader>/', '/\\%V')

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
vim.keymap.set('i', '<M-p>', '"')

vim.keymap.set('', '<M-/>', '<cmd>nohl<CR>', {remap = true})
vim.keymap.set('i', '<M-/>', ':nohl<CR>', {remap = true, silent = true})
vim.cmd([[
  nnoremap <expr> n (v:searchforward ? 'n' : 'N')
  nnoremap <expr> N (v:searchforward ? 'N' : 'n')
]])

vim.keymap.set({'i', 'c'}, '<M-Left>', '<C-Left>')
vim.keymap.set({'i', 'c'}, '<M-Right>', '<C-Right>')

vim.keymap.set('', '<M-[>', '')
vim.keymap.set('', '<M-{>', ':bp<CR>', {silent = true})
vim.keymap.set('', '<M-}>', ':bn<CR>', {silent = true})
vim.keymap.set('', '<leader><leader>', '@q')
vim.keymap.set('', '<leader>ss', ':s/\\%V')

-- pseudo code for focus mode with splits
-- toggle_tabline
-- toggle_last_status
-- toggle_tmux_status

-- psedo code for focus mode from split but only on that window
-- toggle_window
-- toggle_tabline
-- toggle_last_status
-- toggle_tmux_status

local is_current_window_max = false
local window_max_file = ""
local function toggle_window_max()
	if is_current_window_max then
		if not vim.fn.expand("%:p") == window_max_file then
			print("can't minimize window, are you on a different file?")
			return
		end
		is_current_window_max = false
		vim.cmd([[
      exe 'tabc'
      set showtabline=1
      setlocal laststatus=2
    ]])
	else
		is_current_window_max = true
		window_max_file = vim.fn.expand("%:p")
		vim.w.WindowMaxFile = window_max_file
		vim.w.WindowMaxCursor = vim.api.nvim_win_get_cursor(0)[1]
		vim.cmd([[
      exe 'tabe +' .. w:WindowMaxCursor .. ' ' .. w:WindowMaxFile
      normal zz
      set showtabline=0
      setlocal laststatus=0
    ]])
	end
end

local function toggle_last_status()
	if vim.o.laststatus == 0 then
		vim.o.laststatus = 2
	else
		vim.o.laststatus = 0
	end
end

vim.keymap.set("n", "<leader>zw", function() toggle_window_max() end, { silent = true })
vim.keymap.set("n", "<leader>zs", function() toggle_last_status() end)

vim.keymap.set("n", "<leader>zz", function()
	if vim.wo.wrap then
		vim.cmd("set nowrap")
	else
		vim.cmd("set wrap")
	end
end)

vim.keymap.set("x", "<leader>zz", function()
	if vim.wo.wrap then
		vim.cmd([[
      normal 
      set nowrap
      normal gv
    ]])
	else
		vim.cmd([[
      normal 
      set wrap
      normal gv
    ]])
	end
end)

vim.keymap.set("n", "<leader>zn", function()
  if vim.wo.number then
    vim.cmd("set nonumber norelativenumber")
  else
    vim.cmd("set number relativenumber")
  end
end)
