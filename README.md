## My dotfiles
This repository is to track my dotfiles.

# General Instructions
Link what you want. Everything is off by default. Some examples are below.

* `ln -s /path/to/repo/.vimrc ~/.vimrc`

* `ln -s /path/to/repo/.config ~/.config/

* Or individually to an existing dir: `ln -s /path/to/repo/.config/nvim ~/.config/nvim`

See below for individual packages' instructions.

# Vim/Neovim

* This repository requires a fairly new version of Vim or Neovim. Package managers tend to have a
  version that is too old. These days I install Homebrew on Linux to get around this. Then you can
  install neovim with simply `brew install neovim`.

* Install vim-plug according to https://github.com/junegunn/vim-plug.

* Launch Vim or Neovim. run `:PlugInstall`.

* To activate C++ completion, clangd must be installed. Use your OS's package manager for easy
  and good results. Link to `clangd` on your `$PATH` if the binary's name is different. Homebrew
  also has a version that works (and these days Homebrew works well on Linux).

* My Vim config is setup to use `flow` for Javascript editing. Typescript won't work for now.

* Go support can be installing Go (`brew install go` and activated by typing 
  `:GoInstallBinaries` in the editor.

* Activating Rust support is achieved by installing rustup (https://rustup.rs/) and installing 
  the right components:

  ```
  # This command installs rust - do so if you haven't already
  # curl https://sh.rustup.rs -sSf | sh
  rustup update
  rustup component add rls rust-analysis rust-src
  ```
