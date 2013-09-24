" 全般
set encoding=utf-8
set number
set splitright

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
let g:hybrid_use_Xresources = 1
colorscheme hybrid

if has("autocmd")
  " スケルトン
  autocmd BufNewFile *.rb 0r ~/.vim/skeletons/skeleton.rb
  autocmd BufNewFile *.sh 0r ~/.vim/skeletons/skeleton.sh
endif

