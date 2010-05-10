# Make ZSH read its files from ~/.zsh
ZDOTDIR=.zsh

# Note that setting $EDITOR to vim also causes zsh to use vi-like keymaps
export EDITOR=vim

# Most does colorful manpages, among others
#export PAGER=most

# To switch back to emacs mode, use the following:
bindkey -e

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Load colors array
autoload -U colors
colors

#PS1='%(2L.+ .)%# '
#RPS1='%~'

PROMPT="%(2L.+. )%{$fg_bold[blue]%}%# %{$reset_color%}%B"
RPROMPT="%b%{$fg_bold[green]%}%~%{$reset_color%}"

namedir () { $1=$PWD ;  : ~$1 }
function title {
        case $TERM in
                *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]0;$*\a"
                        ;;
                screen) print -Pn "\ek$*\e\\"
                        ;;
        esac
}
function precmd {
        if [[ -n "$SSH_CONNECTION" ]] then
                title %n@%m:%~ - zsh
        else
                title %~ - zsh
        fi
}
function preexec {
    emulate -L zsh
    local -a cmd; cmd=(${(z)1})
        if [[ -n "$SSH_CONNECTION" ]] then
                title %n@%m - $cmd[1]:t "$cmd[2, -1]"
        else
                title $cmd[1]:t "$cmd[2,-1]"
        fi
        print -Pn "$reset_color"
}

# Make delete key a forward delete
bindkey '\e[3~' delete-char

# Bind more useful push-line-or-edit instead of push-line to ESC q
bindkey '\eq' push-line-or-edit

# Define what characters belong to a word
#WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
WORDCHARS='*?[]~=&;!#$%^(){}<>'

# Don't kill background jobs on exit
setopt NO_HUP

# Allow ${} substitutions in prompt variables
setopt PROMPT_SUBST

# Don't print error messages when some globs don't match, but error when all don't.
setopt CSH_NULL_GLOB

# Print the command with expanded history before execution
setopt HIST_VERIFY

# Append to history file after each command is executed
setopt INC_APPEND_HISTORY

# Save more information about commands in the history file
setopt EXTENDED_HISTORY

# Don't save duplicate history entries
setopt HIST_IGNORE_DUPS

# Don't allow overwriting existing files
setopt NO_CLOBBER

# Tidy up history lines
setopt HIST_REDUCE_BLANKS

# Don't store history-related commands
setopt HIST_NO_STORE

# cd into directories if issued as commands
setopt AUTO_CD

# cd into variables if directory can't be found
setopt CD_ABLE_VARS

# Enable extended globbing
setopt EXTENDED_GLOB

# Enable command correction
setopt CORRECT

# Push current directory on every cd
setopt AUTO_PUSHD

# Make pushd go to ~ instead of swapping directories
setopt PUSHD_TO_HOME

# Notify immediately about background job status changes
setopt NOTIFY

# Init new completion system
autoload -U compinit
compinit

# Load menu selection support
zmodload -i zsh/complist

# Always use menu selection
zstyle ':completion:*' menu select=1

# Make ^o drill down menu selections
bindkey -M menuselect '^o' accept-and-infer-next-history

# Complete inside words
setopt COMPLETE_IN_WORD

# Move to end of completed word
setopt ALWAYS_TO_END

# Make lists as compact as possible
setopt LIST_PACKED

# Label completers
zstyle ':completion:*:descriptions' format '%BCompleting %d:%b'

# Order completions by group
zstyle ':completion:*' group-name ''

# Colorize completion lists
zstyle ':completion:*' list-colors ''

if [[ -r ~/.zsh/.aliasrc ]]; then
	source ~/.zsh/.aliasrc
fi

#chpwd() {
#	[[ -t 1 ]] || return
#	case $TERM in
#		(sun-cmd)
#			print -Pn "\e]l%~\e\\"
#		;;
#		(*xterm*|rxvt|(dt|k|E)term)
#			print -Pn "\e]2;%~\a"
#		;;
#	esac
#}

ls()
{
	local ls
	if [[ "$(uname)" == "Linux" ]]; then
		ls=(ls --color=auto)
	else
		ls=(ls -G)
	fi
	command $ls $*
}

mkcd ()
{
	mkdir -p "$*"
	cd "$*"
}
