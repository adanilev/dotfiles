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

function installFzf {
  echo "installing fzf"
  bash ${HOME}/.local/share/nvim/site/pack/plugins/start/fzf/install \
    --no-update-rc --key-bindings --completion
}

function createNotes {
  mkdir -p ${HOME}/notes
}

function installAllTheThings {
  apt install build-essential \
    tmux

}

#assertNvmInstalled
#installFzf
createNotes
