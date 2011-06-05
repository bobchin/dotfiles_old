# 日本語関係
case "${OSTYPE}" in
cygwin*)
    export LANG=ja_JP.SJIS
    export TZ=JST-9
    export JLESSCHARSET=japanese-sjis
    setopt print_eight_bit
    ;;
*)
    export LANG=ja_JP.UTF-8
    export EDITOR=vim
    ;;
esac

# PATH
if ! echo $PATH | grep -q "/opt/local/bin";
then
    case "${OSTYPE}" in
    darwin*)
        export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
        ;;
    *)
        export PATH=/usr/local/bin:$PATH
        ;;
    esac
fi

# screen or tmux
# 一番最初のシェルの場合のみscreenを起動する。
# デタッチされていればそれをリアタッチする。
# $SHLVL: シェルの深さ
function atmux(){
    if tmux ls > /dev/null 2>&1; then
        tmux -2 attach
    else
        tmux -2
    fi
}
if [ $SHLVL = 1 ];then
#    screen -d -R
    atmux
fi

###############プロンプトの設定###############

# zshmisc(1)参照
#  %B %b ボールドにする。終了する。
#  %{...%} エスケープ文字列として読み込む。(あやしげな訳。原文はzshmisc(1)のvisual effectsの段落)
#  %/ 現在のディレクトリ。
#  %_ シェルパーサが持っている状態名
#  %(!.#.%%) 特権ユーザの場合は「#」それ以外の場合は「%」
#  %# 同上
#  ${fg[color]}文字色の設定。fgの部分をbgにすると背景色の設定。エスケープシークエンスで設定することもできる。
#  ESC[XYm       | Y=0 | Y=1 | Y=2 | Y=3 | Y=4 | Y=5 | Y=6 | Y=7 |
#  X= (属性設定) |標準 |太字 |     |     |下線 |点滅 |     |反転 |
#  X=2(属性解除) |     |太字 |     |     |下線 |点滅 |     |反転 |
#  X=3(文字色　) | 黒  | 赤  | 緑  | 黄  | 青  | 紫  | 水色| 白  |
#  X=4(背景色　) | 黒  | 赤  | 緑  | 黄  | 青  | 紫  | 水色| 白  |
# 
# PROMPT ="%/# " （赤文字）:通常のプロンプト
# PROMPT2="%_# " （赤文字）:２行目以降のプロンプト
# SPROMPT="%r is correst? [n,y,a,e]: ":コマンドを打ち間違えたときの「もしかして」プロンプト
autoload -U colors
colors

PROMPT="%B%{$fg[red]%}%/%#%{$reset_color%}%b "
PROMPT2="%B%{$fg[red]%}%_%#%{$reset_color%}%b "
SPROMPT="%B%{$fg[red]%}%r is correct? [n,y,a,e]:%{$reset_color%}%b "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{$fg[cyan]%}${(U)HOST%%.*} ${PROMPT}"

# Emacs style key binding
bindkey -e                            # Emacs Style ex)C-a C-e etc...
bindkey '^?'    backward-delete-char  # for Bascksapce key
bindkey '^H'    backward-delete-char  # for Bascksapce key
bindkey '^[[3~' delete-char           # for DEL key
bindkey '^[[1~' beginning-of-line     # for HOME key
bindkey '^[[4~' end-of-line           # for END key

##############履歴と補完###############

#コマンド履歴関係のキーマップ
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p' history-beginning-search-backward-end
bindkey '^n' history-beginning-search-forward-end
bindkey '\ep' history-beginning-search-backward-end
bindkey '\en' history-beginning-search-forward-end

# 履歴の保持数と履歴ファイルの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # 同じコマンドを重複して記録しない
#setopt share_history        # 履歴の共有

# 補完設定ファイルのパスと補完機能の初期化
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u -d ~/.zcompdump

#タブを押さなくても補完候補を表示する
#autoload predict-on
#predict-off

# display descreption at hokan
zstyle ':completion:*' group-name ''
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptinos' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needs yes

# enable moving in the hokan list
zstyle ':completion:*:default' menu select=1

# case insensitive by hokan
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'l:|=*r:|[.,_-]=* r:|=* m:{a-z}={A-z}'

## shell options ##

# spell check
setopt correct

# display packed width
setopt listpacked

# display file type
setopt listtypes

# no sounds beep
setopt nolistbeep

# after hokan returns prompt line
setopt alwayslastprompt

# automaically display hokan
setopt auto_list

# double tab key enable moving in the hokan list
setopt automenu

# when hoken, deal with slash
setopt autoparamslash
setopt autoremoveslash
setopt autoparamkeys

# auto directory pushd that you can get dirs list by cd -[tab]
setopt autopushd
setopt pushdignoredups

##############エイリアスの設定###############
#OSによる切り替えを行う

setopt complete_aliases    # エイリアスを設定したコマンドでも補完機能を使えるようにする
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -FG -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
cygwin*)
    alias ls="ls -hF --color=tty --show-control-chars"
    ;;
esac
alias la="ls -a"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias w3m="w3m -s"
alias vi="vim"

# for git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'

alias got='git '
alias get='git '

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-256color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*|screen*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  if [ -n "${WINDOW}" ]; then
    preexec () {
      1="$1 "     # deprecated.
      echo -ne "\ek${${(s: :)1}[0]}\e\\"
    }
  fi

  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# http://openlab.dino.co.jp/2008/12/29/201425412.html
# for tramp
# case "$TERM" in
#  dumb | emacs)
#    PROMPT="%m:%~> "
#    unsetopt zle
#    ;;
# esac

# http://d.hatena.ne.jp/rubikitch/20070925#zshcheatsheet
# cheat sheet(C-M-h)
cheat-sheet () { zle -M "`cat ~/.zsh/cheat-sheet.conf`" }
zle -N cheat-sheet
bindkey "^[^h" cheat-sheet
