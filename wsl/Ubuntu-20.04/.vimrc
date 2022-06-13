set number
set relativenumber
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set nowrap
set visualbell
set ignorecase
set belloff=all
set nocompatible

" change color of highlighting all search
hi Search ctermbg=DarkYellow ctermfg=cyan

" change color in visual mode
hi Visual cterm=none ctermbg=DarkGrey ctermfg=cyan

" change leader
let mapleader = " "

" redo -> shift+u
nnoremap U <C-r>

" delete into black hole register
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

" scroll up and down gt (go-top) and gb (go-bottom)
nmap K 15kzz
vmap K 15kzz
nmap J 15jzz
vmap J 15jzz

" wsl yank to clip.exe & to default vim
function! YankClipExe()
    let s:clipCheck = 1
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' && s:clipCheck == 1 | call system(s:clip, @0) | endif
        augroup END
    endif
endfunction

" set into the default vim copy
function! UnYankClipExe()
    let s:clipCheck = 0
endfunction

nmap <leader>c :call YankClipExe()<CR>
vmap <leader>c <Esc>:call YankClipExe()<CR>gvy
map <leader>C :call UnYankClipExe()<CR>

" remap " to macro
nnoremap " @q

" netrw setnumber
let g:netrw_bufsettings = 'number relativenumber'
