.DEFAULT_GOAL := all
SHELL         := /usr/bin/env bash

export SCRIPTS_DIR   := scripts

.PHONY: all
all: dotfiles ansible

.PHONY: dotfiles
dotfiles:
	@$(SCRIPTS_DIR)/copy-dotfiles.sh

.PHONY: ansible
ansible:
	@$(SCRIPTS_DIR)/run-ansible.sh
