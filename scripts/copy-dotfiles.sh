#!/usr/bin/env bash

set -euxo pipefail

DOTFILES_DIR=dotfiles
NVIM_DIR=nvim

# git - linked in `make dotfiles`, don't link so zshrc_work can overwrite
cp "${DOTFILES_DIR}"/gitconfig "${DOTFILES_DIR}"/.gitconfig

# link the dotfiles
find "${DOTFILES_DIR}" -maxdepth 1 -name ".*" | while read -r dotfile; do
  dotfile_path=$(readlink -f "${dotfile}")
  dotfile_name=$(basename "${dotfile}")
  dotfile_link_path="${HOME}"/"${dotfile_name}"

  ln -sfn "${dotfile_path}" "${dotfile_link_path}"
done

# link the nvim
nvim_dir_path=$(readlink -f "${NVIM_DIR}")
ln -sfn "${nvim_dir_path}" "${HOME}"/.config/nvim
