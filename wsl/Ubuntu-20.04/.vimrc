set number
set relativenumber
syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set nowrap
set smartcase
set visualbell
set belloff=all
set nocompatible

" change color of highlighting all search
hi Search ctermbg=DarkYellow ctermfg=cyan

" change color in visual mode
hi Visual cterm=none ctermbg=DarkGrey ctermfg=cyan

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

map <S-Space> <Esc>
imap <S-Space> <Esc>

" wsl yank & unyank
function! YankClipExe()
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endfunction

function! UnyankClipExe()
    let s:unclip = '/dev/null'  " change this path according to your mount point
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:unclip, @0) | endif
    augroup END
endfunction

map <leader>c :call YankClipExe()<CR>
map <leader>C :call UnyankClipExe()<CR>
