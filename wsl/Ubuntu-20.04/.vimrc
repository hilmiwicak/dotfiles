set number
set relativenumber
set visualbell
set nocompatible
syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" redo -> shift+u
nnoremap U <C-r>

" paste lines -> shift+p
nnoremap P yyp
vnoremap P ykp

" delete into black hole register
nnoremap d "_d
vnoremap d "_d

" scroll up and down gt (go-top) and gb (go-bottom)
nmap gt 20kzz
nmap gb 20jzz
