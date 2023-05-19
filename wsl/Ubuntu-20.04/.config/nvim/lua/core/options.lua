vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.linebreak = true
vim.o.belloff = "all"
vim.o.ruler = false
vim.o.undofile = true
vim.o.mouse = ""
vim.o.wrapscan = false
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.showmode = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smarttab = true

vim.o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.g.is_bash = true
vim.o.shell = "bash -l"
vim.env.BASH_ENV = "~/.bash_aliases"

vim.g.mapleader = " "

if vim.fn.has("wsl") then
  local clipboard = {
    name = "wslclipboard",
    copy = {
      [ "+" ] = "/usr/bin/win32yank.exe -i --crlf"
    },
    paste = {
      [ "+" ] = "/usr/bin/win32yank.exe -o --lf"
    },
    cache_enabled = true
  }

  vim.g.clipboard = clipboard
end

-- local function del_registers()
--   local str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
--   local str_table = {}
--   for i = 1, #str do
--     table.insert(str_table, string.sub(str, i, i))
--   end
--   for _, r in pairs(str_table) do
--     vim.fn.setreg(r, {})
--   end
-- end
--
-- vim.api.nvim_create_augroup("DelRegGroup", {clear = true})
-- vim.api.nvim_create_autocmd({"VimEnter"}, {
--   group = "DelRegGroup",
--   pattern = {"*"},
--   callback = function() del_registers() end,
-- })

vim.api.nvim_create_user_command("Nve", "exe 'tabedit '.stdpath('config').'/init.vim'", {})
vim.api.nvim_create_user_command("Nvs", "exe 'source '.stdpath('config').'/init.vim'", {})

local is_curr_focus_window_max = false
local curr_file = ""
local function focus_window()
  if is_curr_focus_window_max then
    if vim.fn.expand("%:p") == curr_file then
      is_curr_focus_window_max = false
      vim.cmd([[
        exe 'tabc'
        set showtabline=1
        setlocal laststatus=2
      ]])
    else
      print("can't minimize window, are you on a different file?")
    end
  else
    is_curr_focus_window_max = true
    curr_file = vim.fn.expand("%:p")
    vim.w.CurrFile = curr_file
    vim.w.CurrLine = vim.api.nvim_win_get_cursor(0)[1]
    vim.cmd([[
      exe 'tabe +' .. w:CurrLine .. ' ' .. w:CurrFile
      normal zz
      set showtabline=0
      setlocal laststatus=0
    ]])
  end
end

vim.keymap.set("n", "<leader>w", function() focus_window() end, {silent = true})

vim.keymap.set("n", "<leader>zz", function() if vim.wo.wrap then vim.cmd("set nowrap") else vim.cmd("set wrap") end end)
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

vim.api.nvim_create_user_command("Ccd", "exe 'cd ' .. expand('%:h')", {})
vim.api.nvim_create_user_command("Tcd", "exe 'tcd ' .. expand('%:h')", {})

local function git_log()
  vim.cmd([[
    exe 'tabnew'
    exe 'read !git lg'
    setlocal nomodifiable
  ]])
end

local function git_status()
  vim.cmd("exe '!git status'")
end

vim.api.nvim_create_user_command("Gl", function () git_log() end, {})
vim.api.nvim_create_user_command("Gs", function () git_status() end, {})
