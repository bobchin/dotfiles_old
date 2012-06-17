" ---------------------------------------------------------------------
" 参考
" http://ho-ki-boshi.blogspot.com/2007/07/vimrc.html
" http://yuroyoro.hatenablog.com/entries/2012/02/11
" https://github.com/yuroyoro/dotfiles
" ---------------------------------------------------------------------

" vi との互換性をもたない
set nocompatible

" vundle {{{
" vundle 起動設定 {{{
" ---------------------------------------------------------------------
" http://vim-users.jp/2011/04/hack215/
"
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
" }}}

let mapleader=' '

" gcc/<C-_><C-_> でコメントアウト vim bible 6-3
Bundle 'tomtom/tcomment_vim'

" <Leader>ig でインデントガイドのトグル vim bible 4-14
Bundle 'nathanaelkane/vim-indent-guides'

" <C-y>, で展開する vim bible 9-7
Bundle 'mattn/zencoding-vim'

" <Leader>tsp で空白整形 or <Leader>t{separator} でセパレータで整形 vim bible 5-11
Bundle 'Align'

" マルチバイト対応の整形
Bundle 'h1mesuke/vim-alignta'

" ヤンクの履歴を保存し後から使用できるようにする vim bible 4-4
Bundle "YankRing.vim"

" テキストオブジェクトを囲んだりする vim bible 5-14
" ys{motion}{surround}            : surround で囲む
" s{surround}                     : 選択範囲をsurroundで囲む
" ds{surround}                    : surround を削除する
" cs{old-surround}{new-surround}  : surround を変更する
Bundle 'tpope/vim-surround'

" テキストオブジェクト vim bible 5-15
" テキストオブジェクトを簡単に作成するためのコアモジュール
Bundle 'kana/vim-textobj-user'
" [z] フォールディングをテキストオブジェクトにする
Bundle 'kana/vim-textobj-fold'
" [i] インデントをテキストオブジェクトにする
Bundle 'kana/vim-textobj-indent'
" [/][?] 最後の検索にマッチした箇所をテキストオブジェクトにする
Bundle 'kana/vim-textobj-lastpat'
" [y] syntax highlight されたものをテキストオブジェクトにする
Bundle 'kana/vim-textobj-syntax'
" いろんなものをテキストオブジェクトにする
Bundle 'thinca/vim-textobj-plugins'
" 関数の中身をテキストオブジェクトにする
Bundle 'kana/vim-textobj-function'

" . で surround.vim の作業を繰り返す vim bible 5-16
Bundle 'tpope/vim-repeat'

" = で設定された入力をループする vim bible 9-4
" Bundle 'smartchr'

" true <=> false などをトグル。Insertモードでは<C-t>, それ以外では +
" <C-t> でトグル用にしている。
Bundle 'taku-o/vim-toggle'

" 自動補完 vim bible 9-10
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'

" ステータスラインをきれいに表示
Bundle 'Lokaltog/vim-powerline'

" Markdownでメモ
Bundle 'tpope/vim-markdown'

" gx でカーソルの文字をブラウザで検索
Bundle 'tyru/open-browser.vim'

" w での単語移動をスマートにする
Bundle 'kana/vim-smartword'

"  ,w でキャメルケースやアンダーバー区切りで単語移動
Bundle 'camelcasemotion'

" <Leader><Leader>w/f で検索先をハイライトして移動 vim bible 4-9
Bundle 'Lokaltog/vim-easymotion'

" % コマンドによる移動を拡張 vim bible 4-10
Bundle 'matchit.zip'

" <Leader>r で編集中のファイルを簡単に実行できる vim bible 6-10
Bundle 'thinca/vim-quickrun'

" <S-k>でカーソル上のキーワードを参照する vim bible 6-5
Bundle 'thinca/vim-ref'

" jsref
Bundle 'mojako/ref-sources.vim'
Bundle 'tokuhirom/jsref'

" trinity
Bundle 'taglist.vim'
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'trinity.vim'

" syntax
Bundle 'jelera/vim-javascript-syntax'
Bundle 'jQuery'

" buffer 操作
Bundle 'tyru/DumbBuf.vim'

" 文字コードの自動認識
Bundle 'banyan/recognize_charcode.vim'

" Bundle 'scrooloose/syntastic'

" vim でシェル vim bible 6-11
Bundle 'Shougo/vimshell'
" vim から非同期実行
Bundle 'Shougo/vimproc'
" vim のファイラー vim bible 2-2
Bundle 'Shougo/vimfiler'

" Unite vim bible 10-1
Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'
Bundle 'tsukkee/unite-tag'
Bundle 'thinca/vim-unite-history'
Bundle 'oppara/vim-unite-cake'

" vimdoc-ja
Bundle 'vim-jp/vimdoc-ja'

Bundle 'motemen/hatena-vim'

Bundle 'altercation/vim-colors-solarized'

Bundle 'gmarik/vundle'

filetype plugin indent on       " ファイル別 plugin (~/.vim/ftplugin/拡張子.vim)
" }}}


" plugin {{{ ----------------------------------------------------------

" tcomment {{{
" <C-_>b ブロックコメント
" <C-_>i 囲むようにコメント
" Space + / コメントをトグル
nmap <Leader>/ <C-_><C-_>
vmap <Leader>/ <C-_><C-_>
" }}}


" indent-guides {{{
" let g:indent_guideson_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" }}}


" Zencoding
" <C-y>,
let g:user_zen_settings = {
\   'indentation' : '    ',
\   'javascript' : {
\       'snippets' : {
\           'jq' : "$function(){\n\t${cursor}${child}\n};",
\           'jq:each' : "$.each(${cursor}, function(index, item){\n\t${child}\n});",
\           'fn' : "(function(){\n\t${cursor}\n})();",
\           'tm' : "setTimeout(function(){\n\t${cursor}\n}, 100);",
\       },
\   },
\}


" Align
let g:Align_xstrlen = 3       " for japanese string
let g:DrChipTopLvlMenu = ''   " remove 'DrChip' menu


" YankRing
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
let g:yankring_max_history = 10
let g:yankring_window_height = 13


" smartchr
" inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')


" toggle
imap <C-t> <Plug>ToggleI
nmap <C-t> <Plug>ToggleN
vmap <C-t> <Plug>ToggleV


" neocomplcache {{{
" 競合するのでAutoComplPopを無効化する
let g:acp_enableAtStartup = 0
" 起動時にneocomplecacheを有効にする
let g:neocomplcache_enable_at_startup = 1
" 補完が自動的に開始される文字数
let g:neocomplcache_auto_completion_start_length = 3
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" Camel Case を有効にする。大文字を区切りとして補完する
let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー区切りとして補完する
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字数
let g:neocomplcache_min_syntax_length = 3
" neocomplcache を自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 一番先頭の候補を選択状態にする
" let g:neocomplcache_enable_auto_select = 1
" 表示する候補の数
let g:neocomplcache_max_list = 20

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'javascript' : $HOME.'/.vim/dict/jacascript.dict',
    \ 'php' : $HOME.'/.vim/dict/php.dict',
    \ 'ctp' : $HOME.'/.vim/dict/php.dict',
    \ 'vm' : $HOME.'/.vim/dict/vim.dict',
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" スニペットを展開する
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
" UNDO
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補の共通部分までを補完する
inoremap <expr><C-l> neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
" imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" key-mappings.
" 補完を確定して閉じる
inoremap <expr><C-y> neocomplcache#close_popup()
" 補完をキャンセルして閉じる
inoremap <expr><C-c> neocomplcache#cancel_popup()
" <CR> 候補が出ていれば確定にする
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB> で補完
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"

" FileType毎のOmni補完を設定
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c          setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'

"ファイルタイプの関連付け
if !exists('g:neocomplcache_same_filetype_lists')
  let g:neocomplcache_same_filetype_lists = {}
endif
let g:neocomplcache_same_filetype_lists['ctp'] = 'php'
" }}}


" powerline
let g:Powerline_symbols = 'fancy'


" open-browser
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


" matchit
let b:match_words = &matchpairs . ",\<if\>:\<endif\>,\<:\>"
let b:match_ignorecase = 1


" quickrun
" <Leader>r で実行
" 横分割するようにする
let g:quickrun_config = {}
let g:quickrun_config._ = {
  \ 'split': 'below',
  \ }
let g:quickrun_config.markdown = {
  \ 'outputter': 'browser',
  \ }


" vim-ref
" S-k でマニュアル検索
let g:ref_phpmanual_path = $HOME . '/.vim/reference/php/'
let g:ref_phpmanual_cmd = 'w3m -dump %s'
let g:ref_alc_cmd='lynx -dump -nonumbers %s'


" jquery
let g:ref_jquery_doc_path = $HOME . '/.vim/reference/jquery/'
let g:ref_javascript_doc_path = $HOME . '/.vim/bundle/jsref/htdocs/'
let g:ref_auto_resize = 1


" taglist
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'


"  DumbBuf
let g:dumbbuf_hotkey = '<Leader>b'


" vimfiler
" vimfiler をデフォルトのファイラーにする
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効化する
" let g:vimfiler_safe_mode_by_default = 0


" unite
" prefix key
nnoremap [unite] <Nop>
nmap f [unite]

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" 常用セット
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" 全部のせ
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" help
nnoremap <C-i> :<C-u>Unite -start-insert help<CR>
nnoremap <C-i><C-i> :<C-u>UniteWithCursorWord help<CR>

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    let g:unite_enable_start_insert = 0

    nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-l> unite#do_action('split')
    nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
endfunction


" hatena.vim
let g:hatena_user='bobchin'

" php-doc
" inoremap <C-r> <ESC>:call PhpDocSingle()<CR>i
" nnoremap <C-r> :call PhpDocSingle()<CR>
" vnoremap <C-r> :call PhpDocRange()<CR>
" let g:pdv_cfg_Type = "string"
" let g:pdv_cfg_Package = ""
" let g:pdv_cfg_Version = "$id$"
" let g:pdv_cfg_Author = "bobchin <bobchin.ryu@gmail.com>"
" let g:pdv_cfg_Copyright = "Copyright(C) 2011 Hokkai Video Inc.All Rights Reserved."
" let g:pdv_cfg_License = "PHP Version 5.2 {@link http://www.php.net/license/}"
" }}}


" ---------------------------------------------------------------------
" 文字コード
" ---------------------------------------------------------------------
set encoding=utf-8                " vim 内部文字コード
set ffs=unix,dos,mac              "
" set fencs=                      " 空白設定すると常に enc で開く
set langmenu=japanese
scriptencoding utf-8

" 以下のファイルの時は文字コードをutf-8に設定
autocmd FileType js :set fileencoding=utf-8
autocmd FileType css :set fileencoding=utf-8
autocmd FileType html :set fileencoding=utf-8
autocmd FileType php :set fileencoding=utf-8

" 指定文字コードで強制的にファイルを開く
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932


" ---------------------------------------------------------------------
" 文字コード判定コマンドの定義（全角文字が化けたら :Fenc を実行）
" ---------------------------------------------------------------------
" command! Fenc call s:Fenc()
" function! s:Fenc()
"     if &modified
"         echo "Err: No write since last change"
"     else
"         set fencs=iso-2022-jp,utf-8,cp932,ucs-2le,ucs-2
"         exec "se fencs-=".&enc
"         e!
"         set fencs=
"     endif
" endfunction


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
set wrapscan                    " 検索が終わったら最初から検索しなおしする
set gdefault                    " 置換で g オプションをデフォルトにする
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
set splitbelow                  " split で新規ウィンドウは下側に
set splitright                  " vsplit で新規ウィンドウは右側に
set title                       " ウィンドウタイトルを書き換える
" set/oldmethod=marker

" カーソル行を強調表示
set cursorline
" augroup highlightCursolLine
"     autocmd!
"     autocmd Colorscheme * highlight clear CursorLine
"     autocmd Colorscheme * highlight CursorLine ctermbg=darkgray guibg=black
" augroup END

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
" 輝度を高くする
" let g:solarized_visibility = "high"
" コントラストを高くする
" let g:solarized_contrast = "high"
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

" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" inoremap <C-f> <PageDown>
" inoremap <C-b> <PageUp>

" F2で前のバッファ
map <F2> <ESC>:bp<CR>
" F3で次のバッファ
map <F3> <ESC>:bn<CR>

" 矩形選択時にテキストがないところでも選択可能にする
set virtualedit+=block

" normal mode 時 ; を : にする
nnoremap ; :

" insert mode 時 <C-w> で保存
inoremap <C-w> <Esc>:<C-u>w<Enter>a

" insert mode 時 jj でノーマルモードへ
inoremap jj <ESC>

" ビジュアルモード時に連続でインデントする
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv


" ---------------------------------------------------------------------
" Help
" C-] <=> C-O
" ---------------------------------------------------------------------
set helplang=ja
" Ctrl-i でヘルプ
" nnoremap <C-i> :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
" nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>
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
set pastetoggle=<Space>sp

" フォーカスを失ったら保存
au FocusLost * :wa


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

