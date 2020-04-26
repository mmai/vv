XDG_CONFIG_HOME = .
XDG_DATA_HOME = ./data
XDG_CACHE_HOME = ./cache

default: start

start:
	XDG_CONFIG_HOME=$(XDG_CONFIG_HOME) XDG_CACHE_HOME=$(XDG_CACHE_HOME) XDG_DATA_HOME=$(XDG_DATA_HOME) nvim
install:
	curl -fLo $(XDG_DATA_HOME)/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# @mkdir -vp "$(XDG_CACHE_HOME)/vim/"{backup,session,swap,tags,undo};
