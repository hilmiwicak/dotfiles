set number
set relativenumber
syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nowrap

" redo -> shift+u
nnoremap U <C-r>

" paste lines -> shift+p
nnoremap P yyp
vnoremap P ykp

" delete into black hole register
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

" X -> cut a line
nnoremap X yydd

" scroll up and down gt (go-top) and gb (go-bottom)
nmap gt 15kzz
vmap gt 15kzz
nmap gb 15jzz
vmap gb 15jzz

" mapping shift space into esc
map <S-Space> <Esc>
imap <S-Space> <Esc>
