source $HOME/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

if [ -L ~/.rbenv ]; then
  eval "$(rbenv init -)"
fi
