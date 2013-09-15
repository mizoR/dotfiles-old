source $HOME/.oh-my-zsh/templates/zshrc.zsh-template

if [ -L ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi

if [ -L ~/.zsh-completions ]; then
  fpath=(~/.zsh-completions/src $fpath)
  autoload -U compinit; compinit
fi

