[ -n "$HOMEBREW_PREFIX" ] || eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)" 


export PATH="/usr/local/bin:/Users/ar/.local/bin:$PATH"
