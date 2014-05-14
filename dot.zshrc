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

if [ -L ~/.zsh-completions ]; then
  fpath=(~/.zsh-completions/src $fpath)
  autoload -U compinit; compinit
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

# https://github.com/huyng/bashmarks
source $HOME/bin/bashmarks.sh
