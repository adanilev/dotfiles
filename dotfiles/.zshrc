# profile zsh perf if sluggish - uncomment last line too
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

# bash reverse history search in both vi command and insert mode
bindkey -M vicmd '^r' history-incremental-pattern-search-backward
bindkey -M viins '^r' history-incremental-pattern-search-backward

# load plugins
source ~/.zsh_plugins.sh

# use vi bindings
bindkey -v
# delete after leaving normal mode in vi-mode
bindkey "^?" backward-delete-char

# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git details
git config --global user.name "Alex Danilevsky"
git config --global user.email "adanilev@users.noreply.github.com"

# load work specific config if it's there
if [ -f "${HOME}/.zshrc_work" ]; then
  source "${HOME}/.zshrc_work"
fi

### aliases ###

# easier ls
alias ll='ls -lh'
alias la='ls -lah'
alias ltr='ls -ltrh'

# safer move and copy
alias cp='cp -i'
alias mv='mv -i'

# use nvim
alias vim='nvim'

# notes
alias notes="cd ${HOME}/notes && vim ."

#zprof
