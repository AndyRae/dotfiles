# The following lines were added by Docker Desktop to add commands to your PATH.
[ -d "$HOME/.docker/bin" ] && export PATH="$PATH:$HOME/.docker/bin"
# End of Docker Desktop section.

[ -n "$HOMEBREW_PREFIX" ] || eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"
