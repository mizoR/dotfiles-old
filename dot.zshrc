# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="eastwood"

plugins=(git)

DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

if [[ ":$PATH:" != *:"/usr/local/bin":* ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

. ~/google-cloud-sdk/path.zsh.inc

if [[ ":$PATH:" != *:"$HOME/bin":* ]]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -L ~/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -d ~/.nodebrew ]; then
  export NODEBREW_ROOT=$HOME/.nodebrew
  export PATH=$NODEBREW_ROOT/current/bin:$PATH
fi

XCODE_BIN=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
if [ -d $XCODE_BIN ]; then
  export PATH="$XCODE_BIN:$PATH"
fi

if [ -d $PYENV_ROOT ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

if [ -L ~/.zsh-completions ]; then
  fpath=(~/.zsh-completions/src $fpath)
  autoload -U compinit; compinit -u
fi

for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && source "$file"
done

chpwd() {
  ls
}

# '^' を押すと上のディレクトリに移動する
function cdup() {
  if [ -z "$BUFFER" ]; then
    echo
    cd ..
    zle reset-prompt
  else
    zle self-insert '^'
  fi
}

zle -N cdup
bindkey '\^' cdup

export BUNDLER_EDITOR=~/dotfiles/bin/bundler.sh

if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# https://github.com/lestrrat/peco
if [ -x "`which peco`" ]; then
  function peco-select-history() {
    local tac
    if which tac > /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | \
      uniq | \
      eval $tac | \
      peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
  }
  zle -N peco-select-history
  bindkey '^r' peco-select-history

  # http://weblog.bulknews.net/post/89635306479/ghq-peco-percol
  function peco-src () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      zle accept-line
    fi
    zle clear-screen
  }
  zle -N peco-src
  bindkey '^]' peco-src


  function peco-git-recent-branches () {
    local selected_branch=$(git for-each-ref --format='%(refname)' --sort=-committerdate refs/heads | \
        perl -pne 's{^refs/heads/}{}' | \
        peco --query "$LBUFFER")
    if [ -n "$selected_branch" ]; then
      BUFFER="git checkout ${selected_branch}"
      zle accept-line
    fi
  }
  zle -N peco-git-recent-branches
  bindkey '^b' peco-git-recent-branches

  function peco-dropbox () {
    local dir=$(find ~/Dropbox/*/* -d | peco --query "$LBUFFER")
    if [ -n "$dir" ]; then
      BUFFER="cd ${dir}"
      zle accept-line
    fi
  }
  zle -N peco-dropbox
  bindkey '^[' peco-dropbox
fi

if [ -x "`which dirnenv`" ]; then
  eval "$(direnv hook zsh)"
fi
