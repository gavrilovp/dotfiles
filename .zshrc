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
alias mk="make"
alias c="cabal"


ZSH_THEME_REPO_NAME_COLOR=%{$fg_bold[red]%}
ZSH_THEME_HG_PROMPT_PREFIX="hg:("
ZSH_THEME_HG_PROMPT_SUFFIX=")"
ZSH_PROMPT_BASE_COLOR=%{$fg[blue]%}

function hg_dirty_choose {
  if [ $(in_hg) ]; then
    hg status 2> /dev/null | command grep -Eq '^\s*[ACDIM!?L]'
    if [ $pipestatus[-1] -eq 0 ]; then
      # Grep exits with 0 when "One or more lines were selected", return "dirty".
      echo "✗"
    else
      # Otherwise, no lines were found, or an error occurred. Return clean.
      echo ""
    fi
  fi
}

function hg_prompt_info {
  if [ $(in_hg) ]; then
    _DISPLAY=$(hg_get_branch_name)
    echo "$ZSH_PROMPT_BASE_COLOR$ZSH_THEME_HG_PROMPT_PREFIX\
$ZSH_THEME_REPO_NAME_COLOR$_DISPLAY$ZSH_PROMPT_BASE_COLOR$ZSH_THEME_HG_PROMPT_SUFFIX$ZSH_PROMPT_BASE_COLOR%{$fg[yellow]%}$(hg_dirty)$ZSH_PROMPT_BASE_COLOR"
    unset _DISPLAY
  fi
}

PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'
