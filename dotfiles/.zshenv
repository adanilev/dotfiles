export XDG_CONFIG_HOME=${HOME}/.config
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_DATA_HOME=${HOME}/.local/share

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
 export NVM_DIR="${XDG_CONFIG_HOME}/nvm"

# fzf settings
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh-nvm
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

### path ###

# don't repeat path params
typeset -U path

# user's bins
path=("${HOME}/bin" $path)
path=("${HOME}/.local/bin" $path)

# load work specific config if it's there
if [ -f "${HOME}/.zshenv_work" ]; then
  source "${HOME}/.zshenv_work"
fi
