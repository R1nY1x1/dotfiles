#!/bin/bash

# +----------+
# | Homebrew |
# +----------+
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# +-----+
# | Git |
# +-----+
brew install git

# +----------+
# | Dotfiles |
# +----------+
git clone https://github.com/R1nY1x1/dotfiles.git $HOME/
ls -n $HOME/dotfiles/mac/.config $HOME/
ls -n $HOME/dotfiles/mac/bash/.bashrc $HOME/
ls -n $HOME/dotfiles/mac/bash/.bash_profile $HOME/
ls -n $HOME/dotfiles/mac/tmux/.tmux.conf $HOME/
ls -n $HOME/dotfiles/mac/vim/.vimrc $HOME/
#ls -n $HOME/dotfiles/mac/vim/.vim $HOME/

# +----------+
# | Terminal |
# +----------+
# 環境設定/プロファイルより追加->デフォルトに設定
git clone https://github.com/stephenway/monokai.terminal.git $HOME/Downloads/
# FontBookよりインストール->環境設定/プロファイル/テキスト/フォントにDiscord版を設定
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git $HOME/Downloads/

# +-----+
# | vim |
# +-----+
brew install vim
# .vimフォルダ作成
mkdir $HOME/.vim
mkdir $HOME/.vim/swap
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/undo
mkdir $HOME/.vim/colors
mkdir $HOME/.vim/bundle
# カラースキームを取得
git clone https://github.com/tomasr/monokai.git $HOME/Downloads/
mv $HOME/Downloads/molokai/colors/monokai.vim $HOME/.vim/colors/
# powerlineを設定
git clone https://github.com/b-ryan/powerline-shell $HOME/Downloads/
sudo python $HOME/Downloads/powerline-shell/setup.py insatall
# eskk
curl "https://skk-dev.github.io/dict/SKK-JISYO.L.gz" -o $HOME/Downloads/SKK-JISYO.L.gz
gzip $HOME/Downloads/SKK-JISYO.L.gz
mv $HOME/Downloads/SKK-JISYO.L $HOME/.config/eskk/

# +------+
# | glow |
# +------+
brew install glow

# +---------+
# | Node.js |
# +---------+
brew install nodebrew
export NODEBREW_ROOT=/opt/homebrew/var/nodebrew
nodebrew setup_dirs
export PATH=/opt/homebrew/var/nodebrew/current/bin:$PATH
# 安定版をインストール
nodebrew install-binaly stable
nodebrew use stable

# +------+
# | Rust |
# +------+
# vim-lspの起動に必要なのでインストール
brew install rustup
rustup-init
export PATH=$HOME/.cargo/bin:$PATH

# +------+
# | tmux |
# +------+
brew install tmux

# +--------+
# | Docker |
# +--------+
# M1版Dockerのインストール
curl https://desktop.docker.com/mac/stable/arm64/Docker.dmg -o $HOME/Downloads/Docker.dmg

exit 0
