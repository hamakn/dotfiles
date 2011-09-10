# thanks to http://blog.veryposi.info/server/server-setup/mac-product-env-zsh/
# users generic .zshrc file for zsh(1)
 
## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac
 
 
## Default shell configuration
#
# set prompt
#
autoload colors
colors
 
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %{${fg[red]}%}%n@%m%#%{${reset_color}%} "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
    ;;
*)
    PROMPT="%{${fg[red]}%}%n@%m%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    RPROMPT="%{${fg[green]}%}[%~:%T]%{${reset_color}%}"
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac
 
# auto change directory
#
setopt auto_cd
 
# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd
 
# command correct edition before each completion attempt
#
setopt correct
setopt correct_all
 
# compacked complete list display
#
setopt list_packed
 
# no remove postfix slash of command line
#
setopt noautoremoveslash
 
# no beep sound when complete list displayed
#
setopt nolistbeep
 
# TABで順に保管候補を切り替える
#
setopt auto_menu
 
# 保管候補一覧でファイルの種別をマーク
#
setopt list_types
 
# = 以降でも補完できるようにする
#
setopt magic_equal_subst
 
# 補完時の日本語を正しく表示する
#
setopt print_eight_bit
 
# 重複するコマンド行は古い方を削除する
#
setopt hist_ignore_all_dups
 
# 履歴を追加
#
setopt append_history
 
# 履歴をインクリメンタルに追加
#
setopt inc_append_history
 
# 補完時に文字列末尾へカーソル移動
#
setopt always_to_end
 
# あいまい補完時に候補表示
#
setopt auto_list
 
# historyコマンドをヒストリリストから取り除く
#
setopt hist_no_store
 
# コマンドの空白を削る
#
setopt hist_reduce_blanks
 
# 先頭が空白だった場合はログに記述しない
#
setopt hist_ignore_space
 
# ビープ音を出さない
#
setopt no_beep
 
# ヒストリを呼び出してから編集可能な状態にする
#
setopt hist_verify
 
# 保管候補のカーソル選択を有効にする
#
zstyle ':completion:*:default' menu select=1
 
# 補完の時に大文字小文字を区別しない(但し、大文字を打った場合は小文字に変換しない)
#
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
 
## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del
 
# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
 
# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete
 
 
## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
 
 
## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit
 
 
## zsh editor
#
autoload zed
 
 
## Prediction configuration
#
#autoload predict-on
#predict-on
 
 
## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work
 
alias where="command -v"
alias j="jobs -l"
 
case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac
 
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
 
alias du="du -h"
alias df="df -h"
 
alias su="su -l"
 
# personal alias
alias g="git"
alias v="vim"
alias r="rails"
 
## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac
 
case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac
 
# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac
 
 
#:q
# load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine
 
# rvm
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
