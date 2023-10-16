vim.g.loaded_netrw = true
vim.g.loaded_netrwPlugin = true

vim.o.number = false
vim.o.relativenumber = false
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
			["+"] = "/usr/bin/win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "/usr/bin/win32yank.exe -o --lf",
		},
		cache_enabled = true,
	}

	vim.g.clipboard = clipboard
end

local function del_registers()
  local str = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
  local str_table = {}
  for i = 1, #str do
    table.insert(str_table, string.sub(str, i, i))
  end
  for _, r in pairs(str_table) do
    vim.fn.setreg(r, {})
  end
end

vim.api.nvim_create_augroup("DelRegGroup", {clear = true})
vim.api.nvim_create_autocmd({"VimEnter"}, {
  group = "DelRegGroup",
  pattern = {"*"},
  callback = function() del_registers() end,
})

-- vim.g.neoformat_verbose = 1

vim.api.nvim_create_user_command("Nne", "exe 'tabedit '.stdpath('config').' | tcd '.stdpath('config'). ''", {})

vim.api.nvim_create_user_command("Ccd", "exe 'cd ' .. expand('%:h')", {})
vim.api.nvim_create_user_command("Tcd", "exe 'tcd ' .. expand('%:h')", {})

vim.api.nvim_create_user_command("Gl", "exe 'Git log --all --graph --abbrev-commit'", {})
