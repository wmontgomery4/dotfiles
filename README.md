## My dotfiles
This repository is to track my dotfiles.

# General Instructions
Link what you want. Everything is off by default. Some examples are below.

* `ln -s /path/to/repo/.vimrc ~/.vimrc`

* `ln -s /path/to/repo/.config ~/.config/

* Or individually to an existing dir: `ln -s /path/to/repo/.config/nvim ~/.config/nvim

See below for individual packages' instructions.

# Vim/Neovim

* Install vim-plug according to https://github.com/junegunn/vim-plug.

* Launch Vim or Neovim. run `:PlugInstall`.

* To activate C++ completion, clangd must be installed. Use your OS's package manager for easy
  and good results. Link to `clangd` on your `$PATH` if the binary's name is different.

* My Vim config is setup to use `flow` for Javascript editing. Typescript won't work for now.
