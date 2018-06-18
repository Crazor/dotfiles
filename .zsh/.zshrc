# Make ZSH read its files from ~/.zsh

ZDOTDIR=.zsh
# Load colors array
autoload -U colors
colors

# Load solarized dircolors
if [[ "`uname`" == "Linux" ]]; then
	eval `dircolors ~/.zsh/dircolors-solarized.ansi-universal`
fi

#PROMPT="%(2L.+. )%{$fg_bold[blue]%}%# %{$reset_color%}%B"
#if [[ "$SSH_CONNECTION" != "" ]]; then
	#RPROMPT="%b%{$fg_bold[green]%}%m:%~%{$reset_color%}"
#else
	#RPROMPT="%b%{$fg_bold[green]%}%~%{$reset_color%}"
#fi

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

# Don't notify about backgrounded jobs
setopt NO_CHECK_JOBS

# Allow ${} substitutions in prompt variables
setopt PROMPT_SUBST

# Don't print error messages when some globs don't match, but error when all don't.
setopt CSH_NULL_GLOB

### History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.history

# Print the command with expanded history before execution
setopt HIST_VERIFY

# Append to history file after each command is executed
setopt INC_APPEND_HISTORY

# Share history between instances
setopt SHARE_HISTORY

# Shared history with local up/down-arrow browsing
bindkey "${key[Up]}" up-line-or-local-history
bindkey "${key[Down]}" down-line-or-local-history

up-line-or-local-history() {
	zle set-local-history 1
	zle up-line-or-history
	zle set-local-history 0
}
zle -N up-line-or-local-history

down-line-or-local-history() {
	zle set-local-history 1
	zle down-line-or-history
	zle set-local-history 0
}
zle -N down-line-or-local-history

# Browse global history
bindkey "[1;5A]" up-line-or-history # Ctrl + cursor up
bindkey "[1;5B]" down-line-or-history # Ctrl + cursor down

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

# Report time after long execution
export REPORTTIME=5
export TIMEFMT="%U user %S system %P cpu %*Es total"

if [[ -r ~/.zsh/.aliasrc ]]; then
	source ~/.zsh/.aliasrc
fi

# Init new completion system
fpath=($HOME/.zsh/func $HOME/.zsh/completion/docker-machine $fpath)
typeset -U fpath
autoload -U compinit
compinit

[[ -s "/Users/crazor/.rvm/scripts/rvm" ]] && source "/Users/crazor/.rvm/scripts/rvm"

#man() {
#	env \
#		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
#		LESS_TERMCAP_md=$(printf "\e[1;31m") \
#		LESS_TERMCAP_me=$(printf "\e[0m") \
#		LESS_TERMCAP_se=$(printf "\e[0m") \
#		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
#		LESS_TERMCAP_ue=$(printf "\e[0m") \
#		LESS_TERMCAP_us=$(printf "\e[1;32m") \
#			man "$@"
#}

# Homebrew recommended:
if [[ -d /usr/local/share/zsh/help ]]; then
	unalias run-help
	autoload run-help
	HELPDIR=/usr/local/share/zsh/help
fi
