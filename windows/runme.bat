# +----------+
# | Dotfiles |
# +----------+
git clone https://github.com/R1nY1x1/dotfiles.git %USERPROFILE%/

# +----------+
# | Terminal |
# +----------+
git clone https://github.com/mzyy94/RictyDiminished-for-Powerline.git %USERPROFILE%\Downloads\RictyDiminished-for-Powerline-master

# +-----+
# | vim |
# +-----+
brew install vim
# .vimフォルダ作成
mkdir %USERPROFILE%\vimfiles
mkdir %USERPROFILE%\vimfiles\swap
mkdir %USERPROFILE%\vimfiles\backup
mkdir %USERPROFILE%\vimfiles\undo
mkdir %USERPROFILE%\vimfiles\colors
mkdir %USERPROFILE%\vimfiles\bundle
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%\vimfiles\bundle\Vundle.vim
mklink %USERPROFILE%\_vimrc %USERPROFILE%\dotfiles\windows\vim\_vimrc
git clone https://github.com/tomasr/molokai.git %USERPROFILE%\Downloads\molokai
move %USERPROFILE%\Downloads\molokai\colors\molokai.vim %USERPROFILE%\vimfiles\colors\
git clone https://github.com/skk-dev/dict.git %USERPROFILE%\Downloads\dict
move %USERPROFILE%\Downloads\dict\colors\SKK-JISYO.L %USERPROFILE%\.config\eskk\
