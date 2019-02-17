map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
if &filetype == 'c'
            exec "!gcc % -o %<"
            exec "!./%<"
elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!./%<"
elseif &filetype == 'java'
            exec "!javac %"
            exec "!java %<"
elseif &filetype == 'sh'
            :!time bash %
elseif &filetype == 'python'
            exec "!python3.6 %"
elseif &filetype == 'html'
            exec "!firefox % &"
elseif &filetype == 'go'
            exec "!go run %"
elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
endif
    endfunc

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

set nu
set showmatch
set smartindent
set autoindent
autocmd FileType c set cindent
autocmd FileType cpp set cindent
autocmd FileType python set expandtab | nnore ; A:<cr>
set smarttab
set nocompatible
set tabstop=4
set shiftwidth=4
syntax enable
syntax on
set mouse=a
set nobackup
set noundofile

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

set enc=utf-8
set fenc=utf-8
set nobomb
