#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
XDG_CONFIG_HOME=$DIR
XDG_DATA_HOME=$DIR/data
XDG_CACHE_HOME=$DIR/cache

main() {
  install_plugins
}

install_plugins() {
  echo "Installing Plug... "
	curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Running PlugInstall... "
  VIMCONF=$VIMCONF XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim +PlugInstall +UpdateRemotePlugins +qall
  echo "done"
}

main $@
