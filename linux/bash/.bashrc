# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi

alias ls="ls --color=auto"
#alias fzf="fzf --preview 'cat {}'"
#export FZF_DEFAULT_COMMAND="find /"
export FZF_DEFAULT_OPTS="--height 40% --reverse --preview 'cat {}'"

export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color

export SHELL=/bin/bash
export EDITOR=vim
eval "$(direnv hook bash)"

# +--------------+
# | Fuzzy Finder |
# +--------------+
# Fuzzy Change Directory
fcd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m)
  cd "$dir"
}

# Fuzzy Git BRanch
fgbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  echo $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Git CheckOut
fgco() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Github RePository
fghrp() {
  local repos repo
  repos=$(gh repo list) &&
  repo=$(echo "$repos" | fzf +m --preview 'gh repo view {}') &&
  echo $(echo "$repo" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Github ISsue
fghis() {
  local issues issue
  issues=$(gh issue list) &&
  issue=$(echo "$issues" | fzf +m) &&
  echo $(echo "$issue" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Github PullRequest
fghpr() {
  local prs pr
  prs=$(gh pr list) &&
  pr=$(echo "$prs" | fzf +m) &&
  echo $(echo "$pr" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Github RePository Create
fghrpc() {
  gh repo create "$@"
  git remote add origin "https://github.com/R1nY1x1/$1.git"
  git branch -M main
  git push -u origin main
}

# Fuzzy Docker ConTainer
fdct() {
  local containers container
  containers=$(docker container ls -a | awk 'NR>=2 {print}') &&
  container=$(echo "$containers" | fzf +m) &&
  echo $(echo "$container" | awk '{print $1}' | sed "s/.* //")
}

# Fuzzy Docker IMage
fdim() {
  local images image
  images=$(docker image ls -a | awk 'NR>=2 {print}') &&
  image=$(echo "$images" | fzf +m) &&
  echo $(echo "$image" | awk '{print $3}' | sed "s/.* //")
}

# Fuzzy Docker EXec
fdex() {
  local containers container
  containers=$(docker container ls -a | awk 'NR>=2 {print}') &&
  container=$(echo "$containers" | fzf +m) &&
  docker exec -it $(echo "$container" | awk '{print $1}' | sed "s/.* //") /bin/bash
}

# +-----------+
# | Thesaurus |
# +-----------+
saurus() {
  $HOME/Documents/Go/Saurus/Saurus $@
}
