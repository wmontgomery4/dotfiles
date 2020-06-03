#!/bin/bash

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "This script is not foolproof or even particularly robust. It's better to read this"
echo "before you run it."

if [ ! -d "$HOME/.config/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvim install node
fi
export NVM_DIR="$HOME/.config/nvm"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

function ensure_linked () {
  if [ -f "$HOME/$1" ]; then
    echo "Backing up ~/$1 to ~/$1.bkp"
    mv $HOME/$1  $HOME/${1}.bkp
  fi
  ln -s $THIS_SCRIPT_DIR/$1 $HOME/$1
}
ensure_linked .bash_profile
ensure_linked .screenrc
ensure_linked .tmux.conf
mkdir -p ~/.config
ensure_linked .config/nvim
