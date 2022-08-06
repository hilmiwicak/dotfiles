" # # # # # # # # # # # # # # # # "
"                                 "
"    vim-plug & plugin settings,  "
"    leader, rtp, lua             "
"                                 "
" # # # # # # # # # # # # # # # # "

let mapleader = " "

call plug#begin('/home/wicak/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sbdchd/neoformat'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
call plug#end()

set rtp+=/home/wicak/.config/nvim/plugged
set rtp+=/home/wicak/.config/nvim/parsers
lua require('init')

" colorschemes
" tokyonight
let g:tokyonight_style = "dark"
let g:tokyonight_italic_comments = 0
let g:tokyonight_italic_keywords = 0
colorscheme tokyonight

" diffview
map <leader>do :DiffviewOpen 
map <leader>dc :DiffviewClose<CR>
map <leader>de :DiffviewToggleFiles<CR>

" fzf
let $FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{.git/*}"'
map <M-p> :Files<CR>
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }

" harpoon
map <silent> <M-m> :lua require('harpoon.ui').toggle_quick_menu()<CR>
map <silent> <M-n> :lua require('harpoon.mark').add_file()<CR>
map <silent> <M-0> :lua require('harpoon.ui').nav_next()<CR>
map <silent> <M-9> :lua require('harpoon.ui').nav_prev()<CR>
map <silent> <M-1> :lua require('harpoon.ui').nav_file(1)<CR>
map <silent> <M-2> :lua require('harpoon.ui').nav_file(2)<CR>
map <silent> <M-3> :lua require('harpoon.ui').nav_file(3)<CR>
map <silent> <M-4> :lua require('harpoon.ui').nav_file(4)<CR>
map <silent> <M-5> :lua require('harpoon.ui').nav_file(5)<CR>

" lsp
map <silent> <leader>ll :lua vim.lsp.buf.hover()<CR>
map <silent> <leader>le :lua vim.diagnostic.open_float()<CR>

" nerdtree 
map <silent> <M-e> :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
map <silent> <M-E> :NERDTree<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1

" neoformat
" Formaters I've downloaded for neoformat
" - prettier
" - stylua

" telescope
map <leader>tf :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
map <leader>tb :lua require('telescope.builtin').buffers()<CR>

" surround
vmap <leader>s<> S<>f>dl;hvhd
vmap <leader>s( S(ldlh%dh
vmap <leader>s{ S{ldlh%dh
vmap <leader>s[ S[ldlh%dh
nmap <leader>s" cs'"
nmap <leader>s' cs"'

" # # # # # # # # # # # # # # # # # # # "
"                                       "
"    terminal, number, colors, tabs,    "
"    mouse, cursor                      "
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

" delete all registers
function! DelRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction

command DelReg call DelRegisters()
autocmd VimEnter * DelReg

" custom commands to edit/source nvimrc (init.vim & init.lua)
command Nle exe 'tabedit '.stdpath('config').'/lua/init.lua'
command Nls exe 'source '.stdpath('config').'/lua/init.lua'
command Nve exe 'tabedit '.stdpath('config').'/init.vim'
command Nvs exe 'source '.stdpath('config').'/init.vim'

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

command Ccd exe 'cd '.expand("%:h")

" esc
map <M-;> <Esc>

" go to definition
map <M-]> 

" alternate file
map <M--> 

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

" toggle word wrap
map <silent> <expr> <leader>z &wrap ? ':set nowrap<CR>' : ':set wrap<CR>'

