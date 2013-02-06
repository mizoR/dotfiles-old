""" Vundle """
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" from github repos.
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/grep.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'quickrun.vim'

filetype indent plugin on

""" Neocomplcache """
let g:neocomplcache_enable_at_startup = 1

""" Vim Configuration """
" for Encoding
set encoding=utf-8

" for Format
set smartcase
set smartindent
set smarttab
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2

" for View
syntax on
set number

if has("autocmd")
  " for Skeleton
  autocmd BufNewFile *.rb 0r ~/.vim/skeletons/skeleton.rb
  autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh

  " for Skelton local
  autocmd BufNewFile *.local.txt 0r ~/.vim/skeletons/skeleton.local.txt

  " for Indent
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
endif

