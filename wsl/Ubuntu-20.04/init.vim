" # # # # # # # # # # # # # # # # # # # "
"                                       "
"    vim-plug & plugin settings, leader "
"    leader, rtp, lua, colorscheme      "
"                                       "
" # # # # # # # # # # # # # # # # # # # "

let mapleader = " "

call plug#begin('/home/wicak/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'jwalton512/vim-blade'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sam4llis/nvim-tundra'
"Plug 'rktjmp/lush.nvim'

Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'sbdchd/neoformat'
"Plug 'Dkendal/nvim-treeclimber'
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
" tokyonight style options : day, night, storm
let g:tokyonight_style = "storm"
let g:tokyonight_italic_comments = 0
let g:tokyonight_italic_keywords = 0
colorscheme tokyonight

" tundra
" idk why but you need to invoke tundra with other colorschemes
" so if you want to use tundra, colorscheme tokyonight has to be uncommented
"colorscheme tundra

" diffview
map <leader>do :DiffviewOpen 
map <leader>dc :DiffviewClose<CR>
map <leader>de :DiffviewToggleFiles<CR>

" emmet
let g:user_emmet_leader_key='<M-i>'
let g:user_emmet_settings = {
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'c',
\  },
\  'xml' : {
\    'extends' : 'html',
\  },
\}

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
map <silent> <M-6> :lua require('harpoon.ui').nav_file(6)<CR>
map <silent> <M-7> :lua require('harpoon.ui').nav_file(7)<CR>
map <silent> <M-8> :lua require('harpoon.ui').nav_file(8)<CR>

" lsp
map <silent> <leader>ll :lua vim.lsp.buf.hover()<CR>
map <silent> <leader>le :lua vim.diagnostic.open_float()<CR>

" nerdtree 
map <silent> <M-e> :NERDTreeToggle<CR>:NERDTreeRefreshRoot<CR>
map <silent> <M-E> :NERDTree<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['^\.git[[dir]]']
let NERDTreeMapOpenSplit='<C-x>'
let NERDTreeMapOpenVSplit='<C-v>'

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

" # # # # # # # # # # # # # # # # # # # "
"                                       "
"    custom mapping & commands,         "
"    autocmd, snippets, folds           "
"                                       "
" # # # # # # # # # # # # # # # # # # # "

" delete all registers
function! DelRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfunction

command DelReg call DelRegisters()
augroup Del_Reg
  autocmd!  
  autocmd VimEnter * DelReg
augroup END

" custom commands to edit/source nvimrc (init.vim & init.lua)
command Nve exe 'tabedit '.stdpath('config').'/init.vim'
command Nvs exe 'source '.stdpath('config').'/init.vim'
command Nle exe 'tabedit '.stdpath('config').'/lua/init.lua'
command Nls exe 'source '.stdpath('config').'/lua/init.lua'

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

" change directory to the current opened file
command Ccd exe 'cd '.expand("%:h")
command Tcd exe 'tcd '.expand("%:h")

" go to definition
map <M-]> 

" alternate file
map <M-[> 

" set foldmethod
map <expr> <leader>zf &foldmethod == 'manual' ? ':set foldmethod=marker<CR>' : ':set foldmethod=manual<CR>'

" buffer previous & next
map <silent> <M-{> :bp<CR>
map <silent> <M-}> :bn<CR>

" move tab to left / right
map <silent> <M-h> :tabm -<CR>
map <silent> <M-l> :tabm +<CR>
map <silent> <M-H> :tabm -<CR>
map <silent> <M-L> :tabm +<CR>

" redo -> shift+u
nnoremap U <C-r>

" c, d, s into blackhole register
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
nnoremap d "_d
nnoremap D "_D
nnoremap s "_s
nnoremap S "_S
vnoremap c "_c
vnoremap C "_C
vnoremap d "_d
vnoremap D "_D
"vnoremap s "_s
xnoremap S "_S

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
map <leader><leader> @q

" clear last used search
map <silent> <leader>/ :let@/ = ""<CR>

" subtitute selection
map <leader>ss :s/\%V

" toggle word wrap
map <silent> <expr> <leader>zz &wrap ? ':set nowrap<CR>' : ':set wrap<CR>'

" snippets
" markdown
nmap <leader>smh a[]()
nmap <leader>smc a[]: #^
nmap <leader>smb a[ ] 
"vmap <leader>Sm
