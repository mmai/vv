# VV : a vim / neovim config

This config comes in two versions : 
- a light one with no dependencies on external tools and no heavy ide plugins that you can use on servers, etc.
- a more complete one, with coding assistance (coc).

## Dependencies for the complete version

The coc plugin requires nodejs installed. 

This config uses these terminal utilities :

* fzf (for displaying lists with fuzzy selection)
* rg or ag ( for searching )
* lf (a powerful file browser)
* pistol (file previewer used by lf)
* bat (a better 'cat' with colors, used by pistol and therefore lf)

## Test without harming your system

This works only for neovim.

The _install.sh_ and _vv.sh_ scripts sets environment variables such that all additional files (plugins, temporary files, cache,...)  will be created in the _vv/_ folder so it will not mess with your current vim / nvim config.

Installation :

```sh
git clone https://github.com/mmai/vv.git
cd vv
./install.sh
```

replace `./install.sh` by `VIMCONF=full ./install.sh` for the complete version.

Execution :

- `./vv.sh` for the light version 
- `VIMCONF=full ./vv.sh` for the complete version.

## Proper install

If you like this config and want to use it as your main one : 
- if you want the full version, add `export VIMCONF=full` to your shell config file ( _~/.bashrc_ ,  _~/.zshrc, etc._).
- if you use Neovim, copy the _nvim_ folder to the default location for your system (on Linux it is usually _~/.config/_)
- if you use Vim, rename _nvim_ to _.vim_ and copy it to your home directory
- install [Plug](https://github.com/junegunn/vim-plug) following the instruction for your system.
- Start a `nvim` session and execute `:PlugInstall`

You also could just keep using _vv.sh_ instead of _nvim_, there is no performance penalty.

## Quick install for vim

`git clone https://github.com/mmai/vv.git && ln -s ./vv/nvim ~/.vim`
