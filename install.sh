#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

function assertNvmInstalled {
  if [[ "$(command -v node)" != *"config/nvm"* ]]; then
    echo "Node.js is not installed (at least not with NVM). Do that first."
    echo "https://github.com/nvm-sh/nvm"
    echo "Exiting..."
    exit 1
  fi
}

# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
function installCoc {
  INSTALL_DIR=${HOME}/.local/share/nvim/site/pack/plugins/start
  EXTENSIONS_DIR=${HOME}/.config/coc/extensions

  if [ -d ${INSTALL_DIR}/coc.nvim-release ]; then
    echo "coc already installed"
  else
    echo "installing coc.nvim"

    mkdir -p ${INSTALL_DIR}
    cd ${INSTALL_DIR}

    TMP_TAR=coc.tar.gz
    curl -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz -o ${TMP_TAR}
    tar -xvf ${TMP_TAR}
    rm ${TMP_TAR}

    echo "installing coc extensions"
    mkdir -p ${EXTENSIONS_DIR}
    if [ ! -f ${EXTENSIONS_DIR}/package.json ]; then
      echo '{"dependencies":{}}'> ${EXTENSIONS_DIR}/package.json
    fi
  fi

  # add more extensions here as required
  npm install --prefix ${EXTENSIONS_DIR} \
    coc-highlight \
    coc-html \
    coc-json \
    coc-tsserver \
    coc-yaml \
    coc-pairs \
    --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
}

function installFzf {
  echo "installing fzf"
  bash ${HOME}/.local/share/nvim/site/pack/plugins/start/fzf/install \
    --no-update-rc --key-bindings --completion
}

assertNvmInstalled
installCoc
installFzf
