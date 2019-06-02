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
# nvm
export NVM_DIR="${HOME}/.nvm"

### path ###

# don't repeat path params
typeset -U path

# user's bin
path=("${HOME}/bin" $path)

# yarn
path=("${HOME}/.yarn/bin" $path)
path=("${HOME}/.config/yarn/global/node_modules/.bin" $path)

source .zshenv_work
