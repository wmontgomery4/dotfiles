## My dotfiles

This repository is to track my dotfiles.

# General Instructions

Link what you want. Everything is off by default. Some examples are below.

- `ln -s /path/to/repo/.bash_profile ~/.bash_profile`

- `ln -s /path/to/repo/.tmux.conf ~/.tmux.conf`

- `ln -s /path/to/repo/.config ~/.config/`

- Or individually to an existing dir: `ln -s /path/to/repo/.config/nvim ~/.config/nvim`

See below for individual packages' instructions.

# Vim

These dotfiles leave Vim and Vi unmolested so that they can be used for quick test editing.

# Neovim

Neovim is turned into an IDE with this setup.

The Neovim setup here has no natural dependencies, it's all Vimscript. However, support for completion
and linting can be added by installing the relevant system packages, as descripted below. Steps for installing
the configuration:

- This repository requires a fairly new version of Vim or Neovim. Package managers tend to have a
  version that is too old. These days I install Homebrew on Linux to get around this. Then you can
  install neovim with simply `brew install neovim`.

- Install vim-plug according to https://github.com/junegunn/vim-plug.

- Launch Vim or Neovim. run `:PlugInstall`.

# CoC

CoC (https://github.com/neoclide/coc.nvim) is a very comprehensive language server plugin used in this
config. It basically turns your neovim into VSCode. Generally, you'll just need to install nodejs.
You might have your own preferred way of doing this, or you may use this method:

```
curl -sL install-node.now.sh/lts | bash
```

Following this, you should install some plugins for the language servers you use. Here are the ones
I use.

```
:CocInstall coc-tsserver coc-python coc-clangd coc-json coc-sourcekit coc-rls coc-prettier coc-go
```

See the CoC documentation for keybindings.
