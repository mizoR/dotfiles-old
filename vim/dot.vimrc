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

