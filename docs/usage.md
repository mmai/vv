# Usage

Default keybindings :

<leader> key is <space>

## Browse

- open sidebar file explorer : <leader>e
- open file explorer in current file directory : -

Both use j to go up directories, k to open directory or file

- quick open file with fzf : C-p

## Edit

- paste from previous copy history : <meta>p / <meta><shift> p
- save with sudo `:W!!`

## Coding

- Show documentation `K`
- Navigate through classes ans functions : <leader>`t`
- Show definitions and usages : <leader>`j`
- Go to definition : `gd`
- Go to type definition : `gy`
- Go to implementation : <leader>`ci`
- Show references : `gr`

## Search

- global search `:Rg thingtosearch`
- global search and replace : `:CocSearch thingtosearch` then do the substitution in the refactor window

## Writing

Abbreviations:
- edit abbreviations in `nvim/after/ftplugin/markdown.vim`
- cancel abbreviation completion with <CTRL>V

## Code

## Git

- view last commits : <leader>c

## Configure

- Open main vim configuration file : ev (Edit Vim)
- Reload configuration : sv (Source Vim)

- test color themes : ':Color', then choose a theme
- keep a color theme : set the theme in the file _appearance.vim_, at the line `execute 'source' g:vvconfpath.'/colors/falcon.vim'
`

## Troubleshooting

### coc keeps installing the same extensions at vim startup

Go to the coc extensions directory ( usually `.config/coc/extensions` on linux ) and list the content of `node_moudles`: the extensions that keeps being installed are probably listed as a plain empty file instead of a directory : remove these files and restart vim. 

