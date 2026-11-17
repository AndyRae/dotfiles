# dotfiles

## Install

```bash copy
    for f in .gitconfig .tmux.conf .zprofile .zshrc; do
      ln -sf "$HOME/dotfiles/$f" "$HOME/$f"
    done

    mkdir -p "$HOME/.config/aerospace"
    ln -sfn "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
    ln -sf "$HOME/dotfiles/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml"
```

## Neovim

Needs Neovim 0.12+, plus the tools the plugins build with:

```bash copy
    xcode-select --install   # C compiler, make, git
    brew install neovim tree-sitter-cli ripgrep fd
    brew install --cask font-jetbrains-mono-nerd-font
```

Then download the plugins (at the versions pinned in `nvim/lazy-lock.json`)
once, instead of on first open:

```bash copy
    nvim --headless "+Lazy! restore" +qa
```

