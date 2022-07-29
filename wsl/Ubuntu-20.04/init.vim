" # # # # # # # # # # # # # # # # "
"                                 "
"    vim-plug & plugin settings,  "
"    leader, rtp, lua             "
"                                 "
" # # # # # # # # # # # # # # # # "

let mapleader = " "

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'

Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'neovim/nvim-lspconfig'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
call plug#end()

set rtp+=~/.config/nvim/plugged
set rtp+=~/.config/nvim/parsers
lua require('init')

" diffview
map <leader>do :DiffviewOpen 
map <leader>dc :DiffviewClose<CR>
map <leader>de :DiffviewToggleFiles<CR>

" fzf
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{.git/*}"'
map <C-p>p :Files<CR>
map <C-p>h :History<CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-i': 'vsplit'
    \ }

" harpoon
map <silent> <C-p>m :lua require('harpoon.ui').toggle_quick_menu()<CR>
map <silent> <C-p>n :lua require('harpoon.mark').add_file()<CR>
map <silent> <C-p>0 :lua require('harpoon.ui').nav_next()<CR>
map <silent> <C-p>9 :lua require('harpoon.ui').nav_prev()<CR>
map <silent> <C-p>1 :lua require('harpoon.ui').nav_file(1)<CR>
map <silent> <C-p>2 :lua require('harpoon.ui').nav_file(2)<CR>
map <silent> <C-p>3 :lua require('harpoon.ui').nav_file(3)<CR>
map <silent> <C-p>4 :lua require('harpoon.ui').nav_file(4)<CR>

" neoformat
let g:neoformat_try_node_exe = 1

" nerdtree 
map <silent> <C-E> :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" telescope-live-grep-args
map <leader>f :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>

" surround
map <leader>S< S<>f>dl;hvhd
map <leader>S( S(ldlh%dh
map <leader>S{ S{ldlh%dh
map <leader>S" cs'"
map <leader>S' cs"'

" # # # # # # # # # # # # # # # # # # # "
"                                       "
"    terminal, number, colors, tabs,    "
"    mouse,                             "
"                                       "
" # # # # # # # # # # # # # # # # # # # "

set number relativenumber nowrap linebreak ignorecase belloff=all noruler
syntax enable
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set mouse=

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175

hi Search ctermbg=DarkYellow ctermfg=cyan

hi Visual cterm=none ctermbg=DarkGrey ctermfg=cyan

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

" yank & paste from/into windows clipboard
vmap Y "+y
nmap <leader>p "+p
nmap <leader>P "+P

" remap for easier macro
nmap <leader><leader> @q

" clear last used search
map <silent> <leader>/ :let@/ = ""<CR>

" put cmd-line source
map <leader>so :source 

" subtitute selection
map <leader>ss :s/\%V

" toggle max current window
let g:isCurrWindowMax = 0
function! MaxWindow()
    let g:isCurrWindowMax = 1
    let g:currentFile = expand('%:p')
    normal :tabe %:set showtabline=0
endfunction

function! MinWindow()
    if expand('%:p') == g:currentFile
        let g:isCurrWindowMax = 0
        normal g	:tabc #:set showtabline=1
    endif
endfunction

map <silent> <expr> <leader>w g:isCurrWindowMax == 0 ? ':call MaxWindow()<CR>' : ':call MinWindow()<CR>'

" toggle word wrap
map <silent> <expr> <leader>z &wrap ? ':set nowrap<CR>' : ':set wrap<CR>'

" print time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>

" custom command edit nvimrc (init.vim)
command Nle exe 'tabedit '.stdpath('config').'/lua/init.lua'
command Nls exe 'source '.stdpath('config').'/lua/init.lua'
command Nve exe 'tabedit '.stdpath('config').'/init.vim'
command Nvs exe 'source '.stdpath('config').'/init.vim'

" delete all registers
function! DelRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction

command DR call DelRegisters()
autocmd VimEnter * DR
