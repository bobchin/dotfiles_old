" ---------------------------------------------------------------------
" 参考
" http://ho-ki-boshi.blogspot.com/2007/07/vimrc.html
" ---------------------------------------------------------------------

" vi との互換性をもたない
set nocompatible


" ---------------------------------------------------------------------
" vundle
" ---------------------------------------------------------------------
filetype off
set rtp+=~/.vim/vundle/
call vundle#rc()

" スクリプト名一覧 http://vim-scripts.org/vim/scripts.html
Bundle 'qickrun.vim'
Bundle 'Align'
Bundle 'surround.vim'
Bundle 'git://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'neocomplcache'


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
command Fenc call s:Fenc()
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
set cursorline                  " カーソル行を強調表示
augroup cch
   autocmd! cch
   " autocmd WinLeave * set nocursorline
   " autocmd WinEnter,BufRead * set cursorline
   autocmd Colorscheme * highlight clear CursorLine
   autocmd Colorscheme * highlight CursorLine ctermbg=black guibg=black
augroup END

" http://vim-users.jp/2009/07/hack40/
set list
set listchars=tab:>.,trail:_,nbsp:%,extends:>,precedes:<
" 全角スペースの表示
augroup highlightIdegraphicSpace
    autocmd! highlightIdegraphicSpace
    autocmd Colorscheme * highlight ZenkakuSpace term=underline ctermbg=lightblue guibg=darkgray
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
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

imap <c-space> <c-x><c-o>       " <c-space> で omni 補完
function! InsertTabWrapper()    " tab で omni 補完
    if pumvisible()
        return "\<c-n>"
    endif
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        return "\<tab>"
    elseif exists('&omnifunc') && &omnifunc == ''
        return "\<c-n>"
    else
        return "\<c-x>\<c-o>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>


" ---------------------------------------------------------------------
" 入力
" ---------------------------------------------------------------------
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" insert mode での移動
imap <C-e> <END>
imap <C-a> <HOME>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 矩形選択時にテキストがないところでも選択可能にする
set virtualedit+=block


" ---------------------------------------------------------------------
" Help
" ---------------------------------------------------------------------
" Ctrl-i でヘルプ
noremap <C-i> :<C-u>help<Space>
" カーソル下のキーワードをヘルプでひく
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><Enter>


" ---------------------------------------------------------------------
" その他
" ---------------------------------------------------------------------
"set mouse=a                    " ターミナルマウスを有効
set hidden                      " 編集中に他ファイルを開ける
filetype plugin indent on       " ファイル別 plugin (~/.vim/ftplugin/拡張子.vim)
" set paste                       " ペースト時にインデントがずれないようにする


" ---------------------------------------------------------------------
" plugin
" ---------------------------------------------------------------------
" NERD_commenter
let mapleader=' '
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
" let g:acp_enableAtStartup = 0
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

"" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"   \ 'default' : '',
"   \ 'vimshell' : $HOME.'/.vimshell_hist',
"   \ 'scheme' : $HOME.'/.gosh_completions'
"   \ }
"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" Plugin key-mappings.
"imap <C-k>     <Plug>(neocomplcache_snippets_expand)
"smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'








