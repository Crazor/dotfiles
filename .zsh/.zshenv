# Tell zsh to look for its files in ~/.zsh
# Note: symlink ~/.zshenv to ~/.zsh/.zshenv
ZDOTDIR=~/.zsh

#if [[ $SHLVL == 1 && ! -o LOGIN ]]; then
if [[ $SHLVL == 1 ]]; then
	source $ZDOTDIR/.zpath
fi
