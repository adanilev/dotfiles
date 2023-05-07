#!/usr/bin/env bash

set -euox pipefail

# git - linked in `make dotfiles`, don't link so zshrc_work can overwrite
cp ${DOTFILES_DIR}/gitconfig ${DOTFILES_DIR}/.gitconfig

for dotfile in $(find ${DOTFILES_DIR} -maxdepth 1 -name ".*"); do
  dotfile_path=$(readlink -f "${dotfile}")
  dotfile_name=$(basename "${dotfile}")
  dotfile_link_path="${HOME}"/"${dotfile_name}"

  ln -sfn "${dotfile_path}" "${dotfile_link_path}"
done
