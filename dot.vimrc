scriptencoding utf-8

" カラー
if stridx($TERM, 'xterm-256color') >= 0
  set t_Co=256
endif

" NeoBunlde で管理しているプラグイン
source ~/.vim/conf.d/bundle.vim

" 基本設定
source ~/.vim/conf.d/base.vim

