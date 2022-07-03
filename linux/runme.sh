#!/bin/bash

# +---------+
# | apt-get |
# +---------+
sudo apt-get update
sudo apt-get upgrade

# +-----+
# | Git |
# +-----+
sudo apt-get install -y git

# +--------+
# | Github |
# +--------+
sudo apt-get install -y gh

# +----------+
# | Dotfiles |
# +----------+
ln -s $HOME/dotfiles/linux/.git/.gitignore_global $HOME/
#ln -s $HOME/dotfiles/linux/.config $HOME/
ln -s $HOME/dotfiles/linux/.config/git $HOME/.config/
ln -s $HOME/dotfiles/linux/.config/gh $HOME/.config/
ln -s $HOME/dotfiles/linux/.config/power-shell $HOME/.config/
mv $HOME/.bashrc $HOME/.bashrc_legacy
ln -s $HOME/dotfiles/linux/bash/.bashrc $HOME/
ln -s $HOME/dotfiles/linux/bash/.bash_profile $HOME/
ln -s $HOME/dotfiles/linux/tmux/.tmux.conf $HOME/
ln -s $HOME/dotfiles/linux/vim/.vimrc $HOME/
ln -s $HOME/dotfiles/linux/vim/.vim $HOME/

# +-----+
# | vim |
# +-----+
sudo apt-get install vim
# .vimフォルダ作成
# mkdir $HOME/.vim
mkdir $HOME/.vim/swap
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/undo
mkdir $HOME/.vim/colors
mkdir $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
# カラースキームを取得
git clone https://github.com/tomasr/molokai.git $HOME/Downloads/molokai
mv $HOME/Downloads/molokai/colors/molokai.vim $HOME/.vim/colors/
# powerlineを設定
sudo apt-get install -y powerline fonts-powerline
# eskk
git clone https://github.com/skk-dev/dict.git
mkdir $HOME/.config/eskk
mv $HOME/Downloads/dict/SKK-JISYO.L $HOME/.config/eskk/

# +------+
# | tmux |
# +------+
sudo apt-get install -y tmux

# +-----+
# | fzf |
# +-----+
sudo apt-get install -y fzf

# +--------+
# | direnv |
# +--------+
sudo apt-get install -y direnv

# +---------+
# | ripgrep |
# +---------+
sudo apt-get install -y ripgrep

# +---------+
# | Node.js |
# +---------+
# sudo apt-get install -y nodejs npm
# sudo npm install -g n
# n stable
# sudo apt-get purge -y nodejs npm

# +----+
# | go |
# +----+
sudo apt-get install -y golang

exit 0
