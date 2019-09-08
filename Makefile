.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR)/dotfiles -name ".*"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
    git submodule update --init --recursive; \
	done
