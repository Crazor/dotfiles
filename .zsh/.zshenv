# Tell zsh to look for its files in ~/.zsh
# Note: symlink ~/.zshenv to ~/.zsh/.zshenv
ZDOTDIR=~/.zsh

source $ZDOTDIR/.zpath

export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

if [ "$TERM_PROGRAM" = "Apple_Terminal" ] || [ "$TERM_PROGRAM" = "iTerm.app" ]; then
	update_terminal_cwd() {
		# Identify the directory using a "file:" scheme URL,
		# including the host name to disambiguate local vs.
		# remote connections. Percent-escape spaces.
		local SEARCH=' '
		local REPLACE='%20'
		local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
		if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
			printf '\e]7;%s\a' "$PWD_URL"
		else
			printf '\033];%s\007' "$PWD_URL"
		fi
	}
	autoload add-zsh-hook
	add-zsh-hook chpwd update_terminal_cwd
	update_terminal_cwd
fi

export EDITOR=vim

# Most does colorful manpages, among others
export PAGER=most

# Note that setting $EDITOR to vim also causes zsh to use vi-like keymaps
# This will switch back to emacs bindings:
bindkey -e

source $ZDOTDIR/zshenv.local
source $ZDOTDIR/promptline.zsh
