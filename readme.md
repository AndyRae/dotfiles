# dotfiles

## Install

```bash copy
    for f in .gitconfig .tmux.conf .zprofile .zshrc; do
      ln -sf "$HOME/dotfiles/$f" "$HOME/$f"
    done
```
