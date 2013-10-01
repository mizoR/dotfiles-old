" NeoBundle で管理しているプラグイン
" @see https://github.com/Shougo/neobundle.vim

set nocompatible

if has('vim_starting')
  filetype plugin off
  filetype indent off

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" vim-indent-guides
" インデントをハイライトする {{{{
  NeoBundle 'nathanaelkane/vim-indent-guides'

  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors           = 1
  let g:indent_guides_guide_size            = 1
  let g:indent_guides_start_level           = 2
" }}}}

" lightline.vim
" ステータスラインの表示のカスタマイズ {{{{
  NeoBundle 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
  set laststatus=2
" }}}}

" syntastic - Syntax checking hacks for vim
" @see https://github.com/scrooloose/syntastic
NeoBundle 'scrooloose/syntastic'

" tcomment_vim
" Visualモード範囲選択時に<C-_><C-_> でコメントアウト
NeoBundle 'tomtom/tcomment_vim'

" vimproc
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin'  : 'make -f make_cygwin.mak',
  \     'mac'     : 'make -f make_mac.mak',
  \     'unix'    : 'make -f make_unix.mak',
  \    },
  \ }

" QuickRun
" @see https://github.com/thinca/vim-quickrun {{{{
  NeoBundle 'thinca/vim-quickrun'

  augroup QuickRunRSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
  augroup END

  autocmd BufRead,BufNewFile *.mkd set filetype=mkd
  autocmd BufRead,BufNewFile *.md  set filetype=mkd

  " 初期値設定
  let g:quickrun_config = {}
  let g:quickrun_config._ = {'runner' : 'vimproc'}

  " _spec.rb の場合、テストを実行
  let g:quickrun_config['ruby.rspec'] = {
  \   'exec': 'bundle exec %c %s',
  \   'command': 'rspec',
  \ }

  " _spec.rb の場合、テストを実行
  let g:quickrun_config['mkd'] = {
  \   'exec': '%c %s',
  \   'command': 'markdown',
  \ }
" }}}}

" neocomplcache - Ultimate auto-completion system for Vim.
" @see https://github.com/Shougo/neocomplcache.vim
" {{{{
  NeoBundle 'Shougo/neocomplcache'
  
  let g:acp_enableAtStartup = 0
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_smart_case = 1
  let g:neocomplcache_min_syntax_length = 3
  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplcache_dictionary_filetype_lists = {'default' : ''}
  inoremap <expr><C-g> neocomplcache#undo_completion()
  inoremap <expr><C-l> neocomplcache#complete_common_string()
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
  endfunction
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  neocomplcache#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y> neocomplcache#close_popup()
  inoremap <expr><C-e> neocomplcache#cancel_popup()
" }}}}

" unite.vim - https://github.com/Shougo/unite.vim {{{{
  NeoBundle 'Shougo/unite.vim'

  " 入力モードで起動
  " let g:unite_enable_start_insert = 1

  " ヤンクされたテキストの履歴取得
  let g:unite_source_history_yank_enable =1

  " 最近開いたファイル履歴の保存数
  let g:unite_source_file_mru_limit = 200

  " <C-u> をPrefix Keyに設定
  nnoremap [unite] <Nop>
  nmap     <C-u> [unite]

  " バッファ一覧を開く
  nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>

  " ヤンク一覧を開く
  nnoremap <silent> [unite]y :<C-u>Unite history/yank<CR>

  " ファイル一覧を開く
  nnoremap <silent> [unite]f :<C-u>UniteWithCurrentDir file<CR>

  " ファイル一覧を開く - Most Recently Used
  nnoremap <silent> [unite]u :<C-u>UniteWithCurrentDir file_mru<CR>
" }}}}

" カラーテーマ {{{
  NeoBundle 'altercation/vim-colors-solarized'

  if stridx($TERM, "xterm-256color") >= 0
    let g:solarized_termtrans=1
    let g:solarized_termcolors= 256
    let g:solarized_contrast = "high"
  endif

  set background=dark
  colorscheme solarized
" }}}}

NeoBundle 'tpope/vim-surround'

syntax on
filetype plugin on
filetype indent on

NeoBundleCheck

