# http://logrepo.blogspot.com/2010/12/zsh.html
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# path for mysql
export PATH=/opt/local/share/mysql5/mysql/:/opt/local/lib/mysql5/bin/:$PATH

# path for gcloud go
# FIXME: downloads以外に移動すべき...
export PATH=$PATH:/Users/katsunori.kawaguchi/Downloads/google-cloud-sdk/platform/google_appengine/

# anyenv
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# peco
bindkey '^]' peco-src

function peco-src() {
  local src=$(ghq list --full-path ¦ peco --query "$LBUFFER")
  if [ -n "$src" ]; then
    BUFFER="cd $src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/katsunori.kawaguchi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/katsunori.kawaguchi/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/katsunori.kawaguchi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/katsunori.kawaguchi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
