# history
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

# cd if you just type a dir name
setopt autocd

# autocorrect commands
setopt correct_all
# automatically list choices on ambiguous completion
setopt auto_list
# automatically use menu completion
setopt auto_menu
# move cursor to end if word had one match
setopt always_to_end

# use compinit for autocompletion
zstyle :compinstall filename '/Users/adanilev/.zshrc'
autoload -Uz compinit
compinit
# use complist to see a list of autocomplete results
zmodload -i zsh/complist
# select completions with arrow keys
zstyle ':completion:*' menu select
# group results by category
zstyle ':completion:*' group-name ''
# style the completion options
zstyle ':completion:::::' completer _expand _complete _ignored

# bash reverse history search
bindkey '^r' history-incremental-search-backward

# load plugins
source ~/.zsh_plugins.sh

# use vi bindings
bindkey -v
# delete after leaving normal mode in vi-mode
bindkey "^?" backward-delete-char
# show the correct vi mode status in the prompt
spaceship_vi_mode_enable


### aliases ###

# easier ls
alias ll='ls -l'
alias la='ls -la'

# safer move and copy
alias cp='cp -i'
alias mv='mv -i'
