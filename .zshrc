export ADOTDIR="$HOME/.zsh/bundle"

source "$HOME/.zsh/antigen/antigen.zsh"


antigen-use oh-my-zsh

antigen-bundle archlinux
antigen-bundle autojump
antigen-bundle gitfast
antigen-bundle mercurial

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme robbyrussell

antigen-apply


alias vi="vim"
alias v="vim"
alias e="emacs"
alias top="htop"
