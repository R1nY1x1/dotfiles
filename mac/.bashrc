function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export PATH=$PATH:/opt/homebrew/bin
export PATH=/opt/homebrew/Cellar/vim/8.2.3650/bin:$PATH

export EDITOR=vim
eval "$(direnv hook bash)"
