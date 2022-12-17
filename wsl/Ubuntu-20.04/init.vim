" # # # # # # # # # # # # # # # # # # # "
"                                       "
"    vim-plug & plugin settings, leader "
"    rtp, lua, netrw                    "
"                                       "
" # # # # # # # # # # # # # # # # # # # "

let mapleader = " "

call plug#begin('/home/wicak/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'jwalton512/vim-blade'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'numToStr/Comment.nvim'

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'marko-cerovac/material.nvim'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

Plug 'sindrets/diffview.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'sbdchd/neoformat'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'pwntester/octo.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
call plug#end()

" netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

set rtp+=/home/wicak/.config/nvim/plugged
set rtp+=/home/wicak/.config/nvim/parsers
lua require('init')

" diffview
map <leader>do :DiffviewOpen 
map <leader>dc :DiffviewClose<CR>
map <leader>de :DiffviewToggleFiles<CR>

" emmet
let g:user_emmet_leader_key='<M-i>'
let g:user_emmet_settings = {
  \ 'php' : {
  \   'extends' : 'html',
  \   'filters' : 'c',
  \ },
  \ 'xml' : {
  \   'extends' : 'html',
  \ },
\}

" harpoon
map <silent> <M-m> :lua require('harpoon.ui').toggle_quick_menu()<CR>
map <silent> <M-n> :lua require('harpoon.mark').add_file()<CR>
map <silent> <M-1> :lua require('harpoon.ui').nav_file(1)<CR>
map <silent> <M-2> :lua require('harpoon.ui').nav_file(2)<CR>
map <silent> <M-3> :lua require('harpoon.ui').nav_file(3)<CR>
map <silent> <M-4> :lua require('harpoon.ui').nav_file(4)<CR>
map <silent> <M-5> :lua require('harpoon.ui').nav_file(5)<CR>
map <silent> <M-6> :lua require('harpoon.ui').nav_file(6)<CR>
map <silent> <M-7> :lua require('harpoon.ui').nav_file(7)<CR>
map <silent> <M-8> :lua require('harpoon.ui').nav_file(8)<CR>

" nvim-tree
map <silent> <M-E> :NvimTreeOpen %:p:h<CR>
map <silent> <M-e>e :NvimTreeToggle<CR>
map <silent> <M-e>f :NvimTreeFindFile<CR>
map <silent> <M-e>r :NvimTreeRefresh<CR>

" neoformat
" Formaters I've downloaded for neoformat
" - prettier
" - stylua
" - denofmt

" diagnostics
map <silent> <leader>ll :lua vim.lsp.buf.hover()<CR>
map <silent> <leader>lc :lua vim.lsp.buf.code_action()<CR>
map <silent> <leader>le :lua vim.diagnostic.open_float()<CR>
map <silent> <leader>lh :lua require('telescope.builtin').diagnostics({bufnr = 0})<CR>
map <silent> <leader>la :lua require('telescope.builtin').diagnostics({root_dir = true, no_unlisted=true})<CR>
map <silent> <leader>lt :lua require('telescope.builtin').lsp_document_symbols()<CR>

" telescope
map <silent> <M-p>p :lua require('telescope.builtin').find_files()<CR>
map <silent> <M-p>h :lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<CR>
map <silent> <M-P> :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>
map <silent> <leader>tb :lua require('telescope.builtin').buffers()<CR>

" trouble


" undotree
map <silent> <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
map <silent> <leader>U :UndotreeFocus<CR>

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
command Nli exe 'tabedit '.stdpath('config').'/lua/init.lua'
command Nlp exe 'tabedit '.stdpath('config').'/lua/scripts/plugin.lua'
command Nlth exe 'tabedit '.stdpath('config').'/lua/scripts/theme.lua'
command Nlts exe 'tabedit '.stdpath('config').'/lua/scripts/treesitter.lua'
command Nll exe 'tabedit '.stdpath('config').'/lua/scripts/lsp.lua'

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

" open tab
nmap <silent> <M-,> gT
nmap <silent> <M-.> gt

" move tab to left / right
nmap <silent> <M-<> :tabm -<CR>
nmap <silent> <M->> :tabm +<CR>

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
map <silent> <leader>// :let@/ = ""<CR>

" search selection
vmap <silent> <leader>/s /\%V

" subtitute selection
map <leader>ss :s/\%V

" join
"command -range J '<,'>join

" toggle word wrap
map <silent> <expr> <leader>zz &wrap ? ':set nowrap<CR>' : ':set wrap<CR>'

" snippets
" markdown
nmap <leader>smH i[]()
nmap <leader>smh a[]()
nmap <leader>smC O[]: #^
nmap <leader>smc o[]: #^
nmap <leader>smt a[ ] 
