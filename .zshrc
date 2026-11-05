export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="nicoulaj"
plugins=()
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../'
alias k='kubectl'
alias h='helm'
alias g='git'
alias gc='git commit -m'

# FNM
eval "$(fnm env --use-on-cd --shell zsh)"

# Yazi shell wrapper: `y` opens yazi and cd's the shell to wherever you
# were browsing on exit (q to cd, Q to quit without cd'ing).
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
}
