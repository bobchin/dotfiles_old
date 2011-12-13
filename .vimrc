" ---------------------------------------------------------------------
" 参考
" http://ho-ki-boshi.blogspot.com/2007/07/vimrc.html
" ---------------------------------------------------------------------

" vi との互換性をもたない
set nocompatible


" ---------------------------------------------------------------------
" vundle: http://vim-users.jp/2011/04/hack215/
"
" Github から取得する場合
" NeoBundle 'user_name/repository_name'
"
" vim-scriptsから取得する場合
" NeoBundle 'script_name'
"
" 上記以外のgitリポジトリから取得する場合
" NeoBundle 'git://repository_url'
" ---------------------------------------------------------------------
filetype off
if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
endif

" スクリプト名一覧 http://vim-scripts.org/vim/scripts.html
let mapleader=' '
" NeoNeoBundle 'gmarik/vundle'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'Align'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'neocomplcache'
NeoBundle 'The-NERD-tree'
NeoBundle 'motemen/hatena-vim'
" [C-y + ,]で展開する
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'smartchr'
NeoBundle 'php-doc-upgrade'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Lokaltog/vim-easymotion'

filetype plugin indent on       " ファイル別 plugin (~/.vim/ftplugin/拡張子.vim)

" ---------------------------------------------------------------------
" plugin
" ---------------------------------------------------------------------
" quickrun
" <Leader>r で実行

" vim-ref
" S-k でマニュアル検索
let g:ref_phpmanual_path = $HOME . '/.vim/phpmanual/'
let g:ref_phpmanual_cmd = 'w3m -dump %s'

" Align
" <Leader>tsp : 空白で整形
" <Leader>t{セパレータ} : セパレータで整形

" NERD_commenter
let g:NERDCreateDefaultMappings = 0         " デフォルトキーマッピングを無効に
let g:NERDSpaceDelims = 1                   " コメントアウト時のスペース数は１

nmap <Leader>/ <Plug>NERDCommenterToggle    " コメントアウトをトグル
vmap <Leader>/ <Plug>NERDCommenterToggle    " コメントアウトをトグル

nmap <Leader>/a <Plug>NERDCommenterAppend   " コメントアウト後すぐに入力
nmap <leader>/9 <Plug>NERDCommenterToEOL    " 行末までコメンアウト
vmap <Leader>/s <Plug>NERDCommenterSexy     " sexyなコメントアウト
vmap <Leader>/b <Plug>NERDCommenterMinimal  " ブロックをコメントアウト

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

" Zencoding
let g:user_zen_settings = {
\   'indentation' : '    ',
\}

" smartchr
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')

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
set smartindent                 " インデント調整あり・コメント維持
set shiftwidth=4                " tab 文字の入力幅
set tabstop=4                   " tab 文字の表示幅
set softtabstop=0               " tab キーを押したときに挿入される空白の量
set expandtab                   " tab を空白文字に置き換え


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
colorscheme zenburn


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

" normal mode での移動
" nnoremap <C-e> <END>
" nnoremap <C-a> <HOME>

" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>

" 矩形選択時にテキストがないところでも選択可能にする
set virtualedit+=block

" 連続でインデントする
vnoremap < <gv
vnoremap > >gv

" insert mode で保存
inoremap <C-w> <Esc>:<C-u>w<Enter>a

" ---------------------------------------------------------------------
" Help
" ---------------------------------------------------------------------
set helplang=ja
" Ctrl-i でヘルプ
" noremap <C-i> :<C-u>help<Space>
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
