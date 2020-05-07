NVIM_PLUGINS_DIR=$(HOME)/.local/share/nvim/site/pack
NVIM_CONFIG_DIR=$(HOME)/.config/nvim

.PHONY: all
all: non-dot-files dotfiles update-zsh-plugins install-all-the-things

.PHONY: dotfiles
non-dot-files:
	mkdir -p ${NVIM_PLUGINS_DIR}; \
	ln -sfn $(CURDIR)/dotfiles/gitconfig $(HOME)/.gitconfig; \
	ln -sfn $(CURDIR)/dotfiles/nvim/plugins ${NVIM_PLUGINS_DIR}/plugins; \
	mkdir -p ${NVIM_CONFIG_DIR}; \
	ln -sfn $(CURDIR)/dotfiles/nvim/init.vim ${NVIM_CONFIG_DIR}/init.vim;

.PHONY: dotfiles
dotfiles:
	for file in $(shell find $(CURDIR)/dotfiles -maxdepth 1 -name ".*"); do \
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
