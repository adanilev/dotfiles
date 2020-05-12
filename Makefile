NVIM_PLUGINS_DIR=$(HOME)/.local/share/nvim/site/pack
NVIM_CONFIG_DIR=$(HOME)/.config/nvim
IDEAVIM_CONFIG_DIR=$(HOME)/.config/ideavim

.PHONY: all
all: non-dot-files dotfiles update-zsh-plugins install-all-the-things

.PHONY: dotfiles
non-dot-files:
	# nvim
	mkdir -p ${NVIM_PLUGINS_DIR}; \
	ln -sfn $(CURDIR)/dotfiles/nvim/plugins ${NVIM_PLUGINS_DIR}/plugins; \
	mkdir -p ${NVIM_CONFIG_DIR}; \
	ln -sfn $(CURDIR)/dotfiles/nvim/init.vim ${NVIM_CONFIG_DIR}/init.vim; \
	ln -sfn $(CURDIR)/dotfiles/nvim/coc-settings.json ${NVIM_CONFIG_DIR}/coc-settings.json; \
	# intellij ideavim
	mkdir -p ${IDEAVIM_CONFIG_DIR}; \
	ln -sfn $(CURDIR)/dotfiles/ideavimrc ${IDEAVIM_CONFIG_DIR}/ideavimrc; \
	# git - linked in `make dotfiles`, don't link so zshrc_work can overwrite
	cp $(CURDIR)/dotfiles/gitconfig $(CURDIR)/dotfiles/.gitconfig;

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
