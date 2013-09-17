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

" カラースキーム
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'tomasr/molokai'

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

" カラースキーム
set background=dark
colorscheme jellybeans

if has("autocmd")
  " スケルトン
  autocmd BufNewFile *.rb 0r ~/.vim/skeletons/skeleton.rb
  autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
endif

