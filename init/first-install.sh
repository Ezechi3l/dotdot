# Oh my zsh install
unset ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Color theme
open ~/init/Nord.itermcolors

# terminfo support for tmux
tic -x ~/init/terminfo

# Marker in bash (cheatsheet command)
# https://github.com/pindexis/marker
git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py

sh ./brew.sh
sh ./node.sh

# lunarvim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
cp ~/.local/bin/lvim ~/.bin/lvim

echo "Don't forget to load all lsp and treesitter in lunarvim with LspInstall and TSInstall"
