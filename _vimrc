syntax enable
syntax on
set nu
set showmatch
set smartindent
set autoindent
set smarttab
set nocompatible
set tabstop=4
set shiftwidth=4
set mouse=a
set nobackup
set noundofile
set enc=utf-8
set fenc=utf-8
set nobomb
autocmd FileType c set cindent
autocmd FileType cpp set cindent
autocmd FileType python set expandtab | nnore ; A:<cr>

inoremap () ()<esc>i
inoremap [] []<esc>i
inoremap <lt>> <lt>><esc>i
inoremap {} {}<esc>i
nnoremap { A{<cr>}<esc>O
nnoremap ; A;<cr>
inoremap "" ""<esc>i
inoremap '' ''<esc>i
inoremap ,, <esc>la
inoremap kj <esc>
