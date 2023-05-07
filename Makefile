.DEFAULT_GOAL := help
SHELL         := /usr/bin/env bash

export DOTFILES_DIR  := dotfiles
export SCRIPTS_DIR   := scripts

.PHONY: dotfiles
dotfiles:
	@$(SCRIPTS_DIR)/copy-dotfiles.sh

.PHONY: update-zsh-plugins
update-zsh-plugins:
	antibody bundle < ${HOME}/.zsh_plugins.txt > ${HOME}/.zsh_plugins.sh

.PHONY: install-all-the-things
install-all-the-things:
	bash $(CURDIR)/install.sh

help:
	@echo 'help me!'

