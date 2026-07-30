# dotfiles

## Install

```bash copy
    for f in .gitconfig .tmux.conf .zprofile .zshrc; do
      ln -sf "$HOME/dotfiles/$f" "$HOME/$f"
    done

    mkdir -p "$HOME/.config"
    ln -sf "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
    ln -sf "$HOME/dotfiles/aerospace.toml" "$HOME/.config/aerospace/aerospace.toml
```

