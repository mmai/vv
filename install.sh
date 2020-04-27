#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
XDG_CONFIG_HOME=$DIR
XDG_DATA_HOME=$DIR/data
XDG_CACHE_HOME=$DIR/cache

main() {
  # install_plugins
  install_coc_plugins
}

install_plugins() {
  echo "Installing Plug... "
	curl -fLo $XDG_DATA_HOME/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  echo "Running PlugInstall... "
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim +PlugInstall +UpdateRemotePlugins +qall
  echo "done"
}

install_coc_plugins() {
  echo "Installing Coc extensions... "
	# CocInstall do not accept too much arguments, so we make several calls -> must quit..
	extensions="coc-marketplace coc-explorer coc-actions coc-pairs coc-highlight"
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim --headless "+CocInstall $extensions"

	extensions="coc-git coc-snippets coc-tabnine coc-yank coc-prettier"
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim --headless "+CocInstall $extensions"

	extensions="coc-html coc-emmet coc-css coc-stylelint coc-tsserver coc-eslint coc-json"
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim --headless "+CocInstall $extensions"

	extensions="coc-vetur coc-yaml coc-phpls coc-python coc-rust-analyser"
  XDG_CONFIG_HOME=$XDG_CONFIG_HOME XDG_CACHE_HOME=$XDG_CACHE_HOME XDG_DATA_HOME=$XDG_DATA_HOME nvim --headless "+CocInstall $extensions"
}

main $@
