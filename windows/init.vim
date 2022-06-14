" vim-plug
call plug#begin()

Plug 'preservim/nerdtree'

Plug 'tpope/vim-surround'

call plug#end()

" arbitrary settings like number, tabs, etc.
set number relativenumber nowrap ignorecase belloff=all
syntax enable
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set modifiable modified

" powershell
let &shell = has('win32') ? 'powershell' : 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

" change color of highlighting all search
hi Search ctermbg=DarkYellow

" change color in visual mode
hi Visual cterm=none ctermbg=DarkGrey ctermfg=cyan

" change leader
let mapleader = " "

" redo -> shift+u
nnoremap U <C-r>

" delete into black hole register
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
vnoremap D "_D

" scroll up and down 
nmap K 15kzz
vmap K 15kzz
nmap J 15jzz
vmap J 15jzz

" yank to clipboard
nmap <leader>y :set clipboard=unnamed<CR>
vmap <leader>y <Esc>:set clipboard=unnamed<CR>gvy
map <leader>Y :set clipboard=<CR>

" remap " to macro
nnoremap <leader>q @q

" ctrl p to nerdtree
map <C-p> :NERDTree<CR>
