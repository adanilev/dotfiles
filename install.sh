#!/usr/bin/env bash

set -o nounset    # error when referencing undefined variable
set -o errexit    # exit when command fails

# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
function installCoc {
  echo "installing coc.nvim"
  mkdir -p ~/.vim/pack/plugins/start
  cd ~/.vim/pack/plugins/start
  curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

  # install extensions
  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  if [ ! -f package.json ]
  then
    echo '{"dependencies":{}}'> package.json
  fi

  # add more extensions here as required
  npm install \
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
  bash ${HOME}/.local/share/nvim/site/pack/plugins/start/fzf/install --no-update-rc --key-bindings --completion
}

# TODO: install nvm
#installCoc
installFzf
