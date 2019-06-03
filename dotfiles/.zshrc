# profile zsh perf if sluggish
#zmodload zsh/zprof

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
zstyle :compinstall filename "${HOME}/.zshrc"
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

# add keys to ssh-agent
ssh-add -K ~/.ssh/id_rsa > /dev/null 2>&1

### aliases ###

# easier ls
alias ll='ls -l'
alias la='ls -la'

# safer move and copy
alias cp='cp -i'
alias mv='mv -i'

# load nvm only when we need to use it because it's slow
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'
