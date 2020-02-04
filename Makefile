.PHONY: all
all: dotfiles update-zsh-plugins install-all-the-things

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

.PHONY: install-all-the-things
install-all-the-things:
	bash $(CURDIR)/install.sh
