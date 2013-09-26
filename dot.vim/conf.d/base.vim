" 全般
set encoding=utf-8
set number
set splitright

" 検索
set ignorecase
set smartcase

" 検索結果をハイライトする
set hlsearch

" <ESC>連打で検索結果ハイライトをリセット
nnoremap <ESC><ESC> :nohlsearch<CR>

" カレント行に下線を引く
set cursorline
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

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


