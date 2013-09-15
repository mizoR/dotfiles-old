scriptencoding utf-8
set nocompatible

if has('vim_starting')
  filetype plugin off
  filetype indent off

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'

syntax on
filetype plugin on
filetype indent on

NeoBundleCheck

" 全般
set encoding=utf-8
set number

" 検索
set ignorecase
set smartcase

" インデント
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

if has("autocmd")
  " スケルトン
  autocmd BufNewFile *.rb 0r ~/.vim/skeletons/skeleton.rb
  autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
endif

