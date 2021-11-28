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


