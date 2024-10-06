-- basic keymap for default nvim
vim.keymap.set({'i', 'c'}, '<M-w>', "", {remap = true})
vim.keymap.set({'i', 'c'}, '<M-d>', "de", {remap = true})
vim.keymap.set({'n', 'v', 'c', 's', 'i', 'o', 'l', 't'}, '<M-;>', "", {remap = true})

vim.keymap.set({'n', 'i'}, '<M-o>', "", {remap = true})
vim.keymap.set('n', '<M-i>', "	")

vim.keymap.set('n', '<M-j>', "")
vim.keymap.set('n', '<M-k>', "")
vim.keymap.set({'i', 'c'}, '<M-j>', "<Down>")
vim.keymap.set({'i', 'c'}, '<M-k>', "<Up>")
vim.keymap.set('x', '<M-j>', ":m '>+1<CR>gv=gv", {silent = true})
vim.keymap.set('x', '<M-k>', ":m '<-2<CR>gv=gv", {silent = true})
-- vim.keymap.set('n', '<M-K>', "V:t '><CR>gv=gv", {silent = true})
-- vim.keymap.set('n', '<M-J>', "V:t '<-1<CR>gv=gv", {silent = true})
vim.keymap.set('x', '<M-K>', ":t '><CR>gv=gv", {silent = true})
vim.keymap.set('x', '<M-J>', ":t '<-1<CR>gv=gv", {silent = true})
vim.keymap.set({'i', 'c'}, '<M-b>', '<C-Left>')
vim.keymap.set({'i', 'c'}, '<M-f>', '<C-Right>')
vim.keymap.set({'i', 'c'}, '<M-h>', '<Left>')
vim.keymap.set({'i', 'c'}, '<M-l>', '<Right>')
vim.keymap.set({'i', 'c'}, '<M-6>', '<Home>')
vim.keymap.set({'i', 'c'}, '<M-4>', '<End>')

vim.keymap.set('n', 'K', '<C-u>zz')
vim.keymap.set('v', 'K', '<C-u>zz')
vim.keymap.set('n', 'J', '<C-d>zz')
vim.keymap.set('v', 'J', '<C-d>zz')

vim.keymap.set('n', '<M-,>', 'gT')
vim.keymap.set('n', '<M-.>', 'gt')
vim.keymap.set('n', '<M-<>', '<cmd>tabm -<CR>', {silent = true})
vim.keymap.set('n', '<M->>', '<cmd>tabm +<CR>', {silent = true})
vim.keymap.set('n', '<M-x>', '<cmd>+tabc<CR>', {silent = true})

vim.keymap.set('x', 'Y', '"+y')
vim.keymap.set('x', 'X', '"+ygvd')
vim.keymap.set('i', '<M-p>', '"')
vim.keymap.set('n', '<leader>p',  '"+p')
vim.keymap.set('n', '<leader>P',  '"+P')

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

vim.keymap.set('', '<M-/>', '<cmd>nohl<CR>', {remap = true})
vim.keymap.set('i', '<M-/>', ':nohl<CR>', {remap = true, silent = true})
vim.keymap.set('', '<leader>ss', ':s/\\%V')
-- search within selection
vim.keymap.set('x', '<leader>/', '/\\%V')

-- vim.cmd([[
--   nnoremap <expr> n (v:searchforward ? 'n' : 'N')
--   nnoremap <expr> N (v:searchforward ? 'N' : 'n')
-- ]])

vim.keymap.set('', '<M-[>', '')

vim.keymap.set('', '<M-{>', ':cNext<CR>', {silent = true})
vim.keymap.set('', '<M-}>', ':cnext<CR>', {silent = true})

vim.keymap.set('n', '<M-C>', '<cmd>!NVIM=1;__fzf_tmux_home_dir__<CR>')

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

vim.keymap.set("n", "<leader>zw", function() toggle_window_max() end, { silent = true })

local function toggle_last_status()
	if vim.o.laststatus == 0 then
		vim.o.laststatus = 2
	else
		vim.o.laststatus = 0
	end
end

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
