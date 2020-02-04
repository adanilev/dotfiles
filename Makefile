.PHONY: all
all: dotfiles update-zsh-plugins install-fzf

.PHONY: dotfiles
dotfiles:
	cp $(CURDIR)/dotfiles/gitconfig $(CURDIR)/dotfiles/.gitconfig; \
	for file in $(shell find $(CURDIR)/dotfiles -name ".*" -depth 1); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
    git submodule update --init --recursive; \
	done

.PHONY: update-zsh-plugins
update-zsh-plugins:
	antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh

.PHONY: install-fzf
install-fzf:
	bash $(CURDIR)/dotfiles/.vim/pack/plugins/start/fzf/install --no-update-rc --key-bindings --completion
