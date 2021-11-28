function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias ls="ls -G"

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/opt/homebrew/var/nodebrew

export EDITOR=vim
eval "$(direnv hook bash)"
