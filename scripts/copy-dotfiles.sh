#!/usr/bin/env bash

set -euxo pipefail

DOTFILES_DIR=dotfiles
XDG_CONFIG_DIR=xdg-config

# git - linked in `make dotfiles`, don't link so zshrc_work can overwrite
cp "${DOTFILES_DIR}"/gitconfig "${DOTFILES_DIR}"/.gitconfig

# link the dotfiles
find "${DOTFILES_DIR}" -maxdepth 1 -name ".*" | while read -r dotfile; do
  dotfile_path=$(readlink -f "${dotfile}")
  dotfile_name=$(basename "${dotfile}")
  dotfile_link_path="${HOME}"/"${dotfile_name}"

  ln -sfn "${dotfile_path}" "${dotfile_link_path}"
done

ls "${XDG_CONFIG_DIR}" | while read -r dir_name; do
  dir_path=$(readlink -e "${XDG_CONFIG_DIR}"/"${dir_name}")
  dir_link_path="${HOME}"/.config/"${dir_name}"

  ln -sfn "${dir_path}" "${dir_link_path}"
done

