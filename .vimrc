filetype off

""" Vundle """
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on

Bundle 'gmarik/vundle'
" -
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
"- Ruby
Bundle 'vim-ruby/vim-ruby'
" - Rails
Bundle 'scrooloose/nerdtree'
Bundle 'rails.vim'
Bundle 'matchit.zip'

filetype on
filetype indent on
filetype plugin on

let g:neocomplcache_enable_at_startup = 1

set number
set tabstop=2
set shiftwidth=2
set expandtab
set noautoindent
