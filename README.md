## My dotfiles

This repository is to track my dotfiles.

# General Instructions

Link what you want. Everything is off by default. Some examples are below.

* `ln -s /path/to/repo/.bash_profile ~/.bash_profile`

* `ln -s /path/to/repo/.tmux.conf ~/.tmux.conf`

* `ln -s /path/to/repo/.config ~/.config/`

* Or individually to an existing dir: `ln -s /path/to/repo/.config/nvim ~/.config/nvim`

See below for individual packages' instructions.

# Vim/Neovim

The Vim/Neovim setup here has no natural dependencies, it's all Vimscript. However, support for completion
and linting can be added by installing the relevant system packages, as descripted below. Steps for installing
the configuration:

* This repository requires a fairly new version of Vim or Neovim. Package managers tend to have a
  version that is too old. These days I install Homebrew on Linux to get around this. Then you can
  install neovim with simply `brew install neovim`.

* Install vim-plug according to https://github.com/junegunn/vim-plug.

* Launch Vim or Neovim. run `:PlugInstall`.

# Activating Langage Support

Completion and linting are supported for Rust, Swift, C++, Go, Python, Javascript, Flow, and Typescript.
Other languages can easily be added.

* To activate C++ completion, clangd must be installed. Use your OS's package manager for easy
  and good results. Link to `clangd` on your `$PATH` if the binary's name is different. Homebrew
  also has a version that works (and these days Homebrew works well on Linux).

* Javascript files should be parsed by Flow is available. The typescript-language-server will be
  used if it's available. See ALE documentation for more information on how these binaries are
  found.

* Go support can be installing Go (`brew install go` and activated by typing 
  `:GoInstallBinaries` in the editor.

* Activating Rust support is achieved by installing rustup (https://rustup.rs/) and installing 
  the right components:

  ```
  # This command installs rust - do so if you haven't already
  # curl https://sh.rustup.rs -sSf | sh
  rustup default nightly
  rustup update
  rustup component add rls rust-analysis rust-src rustfmt clippy
  ```

* Swift support will be enabled if `sourcekit-lsp` is in `$PATH`. this is distributed with
  most toolchains. On MacOSX this strangely enough requires you to `brew install swift` and
  symbolically link it. Note that Swift toolchains are only available for new versions of
  Fedora through dnf (`dnf install swift-lang`) and on some versions of Ubuntu from the
  official binary distributions (not to mention MacOSX) at the time of this writing.

* Activating Python support by installing all dependencies in a virtualenv before starting
  your editor. Make sure the Python version matches, and check project documentation for all
  needed pip dependencies (requirements.txt or the like).

  ```
  # Seek out instructions on installing virtualenv from another source.
  # Usually this ends up being pip install virtualenv
  virtualenv .venv
  source .venv/bin/activate
  python -m pip install --user --upgrade pip
  pip install python-language-server pycodestyle pyflakes autopep8
  ```
