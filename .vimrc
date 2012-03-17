" ---------------------------------------------------------------------
" 参考
" http://ho-ki-boshi.blogspot.com/2007/07/vimrc.html
" ---------------------------------------------------------------------

" vi との互換性をもたない
set nocompatible

" vundle {{{ ----------------------------------------------------------
" http://vim-users.jp/2011/04/hack215/
" Github から取得する場合
" Bundle 'user_name/repository_name'
"
" vim-scriptsから取得する場合
" スクリプト名一覧 http://vim-scripts.org/vim/scripts.html
" Bundle 'script_name'
"
" 上記以外のgitリポジトリから取得する場合
" Bundle 'git://repository_url'
" ---------------------------------------------------------------------
filetype off
if has('vim_starting')
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
endif

let mapleader=' '

" Edit{{{
  " gcc でコメントアウト vim bible 6-3
  " Bundle 'scrooloose/nerdcommenter'
  Bundle 'tomtom/tcomment_vim'
  " <Leader>ig でインデント vim bible 4-14
  Bundle 'nathanaelkane/vim-indent-guides'
  " [C-y + ,]で展開する vim bible 9-7
  Bundle 'mattn/zencoding-vim'
  " <Leader>tsp で空白整形 or <Leader>t{separator} でセパレータで整形 vim bible 5-11
  Bundle 'Align'
  " vim bible 5-14
  " ys{motion}{surround}            : surround で囲む
  " s{surround}                     : 選択範囲をsurroundで囲む
  " ds{surround}                    : surround を削除する
  " cs{old-surround}{new-surround}  : surround を変更する
  Bundle 'tpope/vim-surround'
  " . で surround.vim の作業を繰り返す vim bible 5-16
  Bundle 'tpope/vim-repeat'
  " = で設定された入力をループする vim bible 9-4
  Bundle 'smartchr'
  " テキストオブジェクト vim bible 5-13, 5-15
  Bundle 'kana/vim-textobj-user'
  " [z]
  Bundle 'kana/vim-textobj-fold'
  " [i]
  Bundle 'kana/vim-textobj-indent'
  " [/][?]
  Bundle 'kana/vim-textobj-lastpat'
  " [y]
  Bundle 'kana/vim-textobj-syntax'
  " []
  Bundle 'thinca/vim-textobj-plugins'
  Bundle 'kana/vim-textobj-function'
  Bundle 'nelstrom/vim-textobj-rubyblock'
  Bundle 'kana/vim-textobj-entire'

  Bundle 'taku-o/vim-toggle'
" }}}

" Completion{{{
  Bundle 'Shougo/neocomplcache'
  " Bundle 'ujihisa/neco-ruby'
  " Bundle 'ujihisa/neco-look'
" }}}

" Searching/Moving{{{
  " Bundle 'Smooth-Scroll'
  " Bundle 'smartword'
  " Bundle 'camelcasemotion'
  Bundle 'Lokaltog/vim-easymotion'
  " Bundle 'matchit'
  " Bundle 'ruby-matchit'
  " Bundle 'tyru/open-browser.vim'
" }}}

" Programming{{{
  Bundle 'thinca/vim-quickrun'
  Bundle 'thinca/vim-ref'
  " Bundle 'SQLUtilities'
  " Bundle 'vim-ruby/vim-ruby'
  " Bundle 'tpope/vim-rails'
  " Bundle 'taglist.vim'
  " Bundle 'Source-Explorer-srcexpl.vim'
  " Bundle 'trinity.vim'
  Bundle 'php-doc-upgrade'
" }}}

" Syntax{{{
  " Bundle 'JavaScript-syntax'
  " Bundle 'jQuery'
  " Bundle 'tpope/vim-markdown'
  " Bundle 'scrooloose/syntastic'
" }}}

" Utility{{{
  Bundle 'Shougo/vimshell'
  Bundle 'Shougo/vimproc'
  Bundle 'Shougo/vimfiler'
  Bundle 'motemen/hatena-vim'
" }}}

" Unite{{{
  Bundle 'Shougo/unite.vim'
" }}}

" ColorSchema{{{
  Bundle 'altercation/vim-colors-solarized'
  " Bundle 'tsukkee/unite-help'
  Bundle 'basyura/unite-rails'
" }}}

Bundle 'gmarik/vundle'

filetype plugin indent on       " ファイル別 plugin (~/.vim/ftplugin/拡張子.vim)
" }}}


" plugin {{{ ----------------------------------------------------------

" NERD_commenter {{{
" let g:NERDCreateDefaultMappings = 0         " デフォルトキーマッピングを無効に
" let g:NERDSpaceDelims = 1                   " コメントアウト時のスペース数は１
" 
" nmap <Leader>/ <Plug>NERDCommenterToggle    " コメントアウトをトグル
" vmap <Leader>/ <Plug>NERDCommenterToggle    " コメントアウトをトグル
" 
" nmap <Leader>/a <Plug>NERDCommenterAppend   " コメントアウト後すぐに入力
" nmap <leader>/9 <Plug>NERDCommenterToEOL    " 行末までコメンアウト
" vmap <Leader>/s <Plug>NERDommenterSexy      " sexyなコメントアウト
" vmap <Leader>/b <Plug>NERDCommenterMinimal  " ブロックをコメントアウト
" tcomment
nmap <Leader>/ gcc
vmap <Leader>/ gc
" }}}

" indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" }}}

" Zencoding
let g:user_zen_settings = {
\   'indentation' : '    ',
\}

" Align
let g:Align_xstrlen = 3       " for japanese string
let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu

" smartchr
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')

" quickrun
" <Leader>r で実行

" vim-ref
" S-k でマニュアル検索
let g:ref_phpmanual_path = $HOME . '/.vim/phpmanual/'
let g:ref_phpmanual_cmd = 'w3m -dump %s'
let g:ref_alc_cmd='lynx -dump -nonumbers %s'

" neocomplcache
" https://github.com/Shougo/neocomplcache/wiki/Presentation-file
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" vimfiler
let g:vimfiler_as_default_explorer = 1

" hatena.vim
let g:hatena_user='bobchin'

" php-doc
inoremap <C-r> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-r> :call PhpDocSingle()<CR>
vnoremap <C-r> :call PhpDocRange()<CR>
let g:pdv_cfg_Type = "string"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "bobchin <bobchin.ryu@gmail.com>"
let g:pdv_cfg_Copyright = "Copyright(C) 2011 Hokkai Video Inc.All Rights Reserved."
let g:pdv_cfg_License = "PHP Version 5.2 {@link http://www.php.net/license/}"
" }}}

" ---------------------------------------------------------------------
" 文字コード
" ---------------------------------------------------------------------
set enc=utf-8                   " vim 内部文字コード
set fencs=                      " 空白設定すると常に enc で開く
set langmenu=japanese

scriptencoding utf-8


" ---------------------------------------------------------------------
" 文字コード判定コマンドの定義（全角文字が化けたら :Fenc を実行）
" ---------------------------------------------------------------------
command! Fenc call s:Fenc()
function! s:Fenc()
    if &modified
        echo "Err: No write since last change"
    else
        set fencs=iso-2022-jp,utf-8,cp932,ucs-2le,ucs-2
        exec "se fencs-=".&enc
        e!
        set fencs=
    endif
endfunction


" ---------------------------------------------------------------------
" インデント
" ---------------------------------------------------------------------
set autoindent                  " 自動でインデント
set smartindent                 " インデント調整あり・コメント維持
set shiftwidth=4                " tab 文字の入力幅
set tabstop=4                   " tab 文字の表示幅
set softtabstop=0               " tab キーを押したときに挿入される空白の量
set expandtab                   " tab を空白文字に置き換え
if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on

  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
endif


" ---------------------------------------------------------------------
" 削除
" ---------------------------------------------------------------------
set backspace=indent,eol,start  " BS でindent,改行,挿入開始前を削除
set smarttab                    " BS でインデント幅を削除


" ---------------------------------------------------------------------
" 検索
" ---------------------------------------------------------------------
set hlsearch                    " 検索文字列を色付け
set ignorecase                  " 大文字小文字を判別しない
set smartcase                   " でも大文字小文字が混ざってい入力されたら区別する
set incsearch                   " インクリメンタルサーチ
" enter で検索ハイライトをクリア
nnoremap <silent> <cr> :noh<cr><cr>
" visual 選択中に * で選択文字列を検索
vnoremap * y/\V<c-r>=substitute(escape(@@,"/\\"),"\n","\\\\n","ge")<cr><cr>gV


" ---------------------------------------------------------------------
" バックアップ
" ---------------------------------------------------------------------
"set backup                      " ファイル上書きでバックアップファイルを作成
"set backupdir=/vim_back
"set directory=/vim_back


" ---------------------------------------------------------------------
" 表示
" ---------------------------------------------------------------------
set background=dark             " 背景の明るさ。light or dark
syntax on                       " シンタックスの色付けを有効
set ruler                       " 左下に行列位置を表示
set showcmd                     " 入力中のコマンドを右下に表示
set showmatch                   " カッコの入力で対応するカッコを一瞬強調
set splitright                  " vsplit で新規ウィンドウは右側に
set title                       " ウィンドウタイトルを書き換える
" set/oldmethod=marker

" カーソル行を強調表示
set cursorline
augroup highlightCursolLine
    autocmd!
    autocmd Colorscheme * highlight clear CursorLine
    autocmd Colorscheme * highlight CursorLine ctermbg=darkgray guibg=black
augroup END

" 全角スペースの表示
scriptencoding utf-8
augroup highlightIdegraphicSpace
    autocmd!
    autocmd ColorScheme * highlight IdegraphicSpace term=underline ctermbg=lightblue guibg=darkblue
    autocmd VimEnter,WinEnter * match IdegraphicSpace /　/
augroup END

" http://vim-users.jp/2009/07/hack40/
set list
set listchars=tab:>.,trail:_,nbsp:%,extends:>,precedes:<

set t_Co=256
set ttymouse=xterm2

" カラーテーマ
" colorscheme zenburn
colorscheme solarized

" ---------------------------------------------------------------------
" 補完
" ---------------------------------------------------------------------
set wildmenu                    " コマンド入力をタブで補完
set wildchar=<Tab>              " コマンド補完を開始するキー
set wildmode=list:longest,full  " 補完動作（リスト表示で最長一致、その後選択）
set history=1000                " コマンドの履歴数

" <c-space> で omni 補完
inoremap <C-Space> <C-x><C-o>

" function! InsertTabWrapper()    " tab で omni 補完
    " if pumvisible()
        " return "\<c-n>"
    " endif
    " let col = col('.') - 1
    " if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        " return "\<tab>"
    " elseif exists('&omnifunc') && &omnifunc == ''
        " return "\<c-n>"
    " else
        " return "\<c-x>\<c-o>"
    " endif
" endfunction
" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>


" ---------------------------------------------------------------------
" 入力
" ---------------------------------------------------------------------
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <PageDown>
inoremap <C-b> <PageUp>

" F2で前のバッファ
map <F2> <ESC>:bp<CR>
" F3で次のバッファ
map <F3> <ESC>:bn<CR>

" 矩形選択時にテキストがないところでも選択可能にする
set virtualedit+=block

" 連続でインデントする
vnoremap < <gv
vnoremap > >gv

" insert mode で保存
inoremap <C-w> <Esc>:<C-u>w<Enter>a

" ---------------------------------------------------------------------
" Help
" C-] <=> C-O
" ---------------------------------------------------------------------
set helplang=ja
" Ctrl-i でヘルプ
noremap <C-i> :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
" ヘルプをqで閉じる
augroup CloseHelpWithQ
    autocmd!
    autocmd FileType help nnoremap <buffer>q <C-w>c
augroup END


" ---------------------------------------------------------------------
" その他
" ---------------------------------------------------------------------
" set mouse=a                     " ターミナルマウスを有効
set hidden                      " 編集中に他ファイルを開ける
" set paste をトグル
nnoremap <Space>sp :<C-u>set invpaste \| set paste?<CR>


" ---------------------------------------------------------------------
" Web+DB Vol52
" ---------------------------------------------------------------------
" .vimrc を編集する
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
" .vimrc をリロードする
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

" 挿入モード時に日付を挿入する
inoremap <expr> ,df strftime('%Y-%m-%d %T')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" 最後に選択した範囲を選択する
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>

" カレントウィンドウのみカーソル行をハイライトする
augroup highlightOnlyCurrentWindow
    autocmd!
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END


" ---------------------------------------------------------------------
" Vim テクニックバイブル
" ---------------------------------------------------------------------
" PHP 文法チェック
augroup phpSyntaxCheck
    autocmd!
    autocmd BufWrite *.php w !php -l
augroup END

