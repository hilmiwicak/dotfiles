" # # # # # # # # # # # # # # # # # "
"                                   "
"    vim-plug & plugin settings     "
"                                   "
" # # # # # # # # # # # # # # # # # "

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/vim-plug'

Plug 'preservim/nerdtree'

Plug 'tpope/vim-surround'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'pwntester/octo.nvim'

Plug 'sindrets/diffview.nvim'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

" nerdtree settings & custom commands
map <silent> <C-E>e :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" fzf
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{.git/*}"'
map <C-p> :Files<CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-s': 'vsplit'
    \ }

" diffview
map <C-E>do :DiffviewOpen 
map <C-E>dc :DiffviewClose<CR>
map <C-E>de :DiffviewToggleFiles<CR>

" # # # # # # # # # # # # # # # # # # # # # # # "
"                                               "
"    terminal, number, colors, tabs, leader,    "
"    lua, rtp,                                  "
"                                               "
" # # # # # # # # # # # # # # # # # # # # # # # "

set rtp+=~/.config/nvim/plugged
lua require('init')

set number relativenumber nowrap linebreak ignorecase belloff=all
syntax enable
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
filetype plugin on
set omnifunc=syntaxcomplete#Complete

hi Search ctermbg=DarkYellow ctermfg=cyan

hi Visual cterm=none ctermbg=DarkGrey ctermfg=cyan

let mapleader = " "

" telling terminal to use bash
let g:is_bash = 1

" # # # # # # # # # # # # # # # #  "
"                                  "
"    custom mapping & commands     "
"                                  "
" # # # # # # # # # # # # # # # #  "

" redo -> shift+u
nnoremap U <C-r>

" delete into black hole register
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap D "_D

" scroll up and down 
nmap K <C-u>
vmap K <C-u>
nmap J <C-d>
vmap J <C-d>

" remap for easier macro
nnoremap <leader>q @q

" clear last used search
map <silent> <leader>/ :let@/ = ""<CR>

" put cmd-line source
map <leader>so :source 

" subtitute selection
map <leader>ss :s/\%V

" toggle max current window
let isCurrWindowMax = 0
map <silent> <expr> <leader>w isCurrWindowMax == 0 ? ':set showtabline=0<CR>:let g:isCurrWindowMax = 1<CR><C-w>\|<C-w>_' : ':set showtabline=1<CR>:let g:isCurrWindowMax = 0<CR><C-w>='

" toggle word wrap
map <silent> <expr> <leader>z &wrap ? ':set nowrap<CR>' : ':set wrap<CR>'

" print time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" custom command edit nvimrc (init.vim)
command NvimLuaEdit exe 'edit '.stdpath('config').'/lua/init.lua'
command NvimLuaSource exe 'source '.stdpath('config').'/lua/init.lua'
command NvimrcEdit exe 'edit '.stdpath('config').'/init.vim'
command NvimrcSource exe 'source '.stdpath('config').'/init.vim'

" wsl yank to clip.exe & to default vim
let g:clipCheck = 0
function! YankClipExe()
    let g:clipCheck = 1
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' && g:clipCheck == 1 | call system(s:clip, @0) | endif
        augroup END
    endif
endfunction

" set into the default vim copy
function! UnYankClipExe()
    let g:clipCheck = 0
endfunction

nmap <silent> <expr> <leader>y g:clipCheck ? ':call UnYankClipExe()<CR>' : ':call YankClipExe()<CR>'
vmap <silent> <expr> <leader>y g:clipCheck ? '<Esc>gvy' : '<Esc>:call YankClipExe()<CR>gvy:call UnYankClipExe()<CR>'
