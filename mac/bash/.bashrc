function _update_ps1() {
  PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias ls="ls -G"
#alias fzf="fzf --preview 'cat {}'"
export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'cat {}'"

export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/opt/homebrew/var/nodebrew
export PATH=$HOME/.cargo/bin:$PATH

export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

export SHELL=/bin/bash
export EDITOR=vim
eval "$(direnv hook bash)"
. "$HOME/.cargo/env"

# Fuzzy Change Directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
  cd "$dir"
}

# Fuzzy git checkout BRanch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy docker container EXec
fex() {
  local containers container
  containers=$(docker container ls | awk 'NR>=2 {print}') &&
  container=$(echo "$containers" | fzf +m) &&
  docker exec "$@" $(echo "$container" | awk '{print $1}' | sed "s/.* //") /bin/bash
}

# Fuzzy docker image RUN
frun() {
  local images image
  images=$(docker image ls | awk 'NR>=2 {print}') &&
  image=$(echo "$images" | fzf +m) &&
  docker run "$@" $(echo "$image" | awk '{print $3}' | sed "s/.* //") /bin/bash
}

# Fuzzy docker image ReMove
frm() {
  local images image
  images=$(docker image ls | awk 'NR>=2 {print}') &&
  image=$(echo "$images" | fzf +m) &&
  docker image rm $(echo "$image" | awk '{print $3}' | sed "s/.* //")
}
