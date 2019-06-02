# show colours for ls output
export CLICOLOR=1

# reduce time for switching to normal mode in vi-mode
export KEYTIMEOUT=1

# shell history
export HISTFILE=~/.zsh_histfile
# save 100k commands
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
# ignore some commands
export HISTORY_IGNORE="(ls|ll|la|pwd|cd|exit)"
