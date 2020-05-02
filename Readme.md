# VV : a nvim config

## Dependencies

The coc plugin requires nodejs installed. 

This config uses these terminal utilities :

* fzf (for displaying lists with fuzzy selection)
* rg or ag ( for searching )
* lf (a powerful file browser)
* pistol (file previewer used by lf)
* bat (a better 'cat' with colors, used by pistol and therefore lf)

## Test without harming your system

The _install.sh_ and _vv.sh_ scripts sets environment variables such that all additional files (plugins, temporary files, cache,...)  will be created in the _vv/_ folder so it will not mess with your current vim / nvim config.

Installation :

```sh
git clone https://github.com/mmai/vv.git
cd vv
./install.sh
```

Execution :

```sh
./vv.sh
```

## Proper install

If you like this config and want to use it as your main one, just copy the nvim folder to the default location for your system (on Linux it is usually _~/.config/_), install [Plug](https://github.com/junegunn/vim-plug) following the instruction for your system. Start a `nvim` session and execute `:PlugInstall`.

(You also could just keep using _vv.sh_ instead of _nvim, there is no performance penalty)
