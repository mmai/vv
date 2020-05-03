# Usage

Default keybindings :

<leader> key is <space>

## Browse

- open sidebar file explorer : <leader>e
- open file explorer in current file directory : -

Both use j to go up directories, k to open directory or file

- quick open file with fzf : C-p

## Edit

- save with sudo `:W!!`

## Search

- global search `:Rg thingtosearch`

## Code

## Git

- view last commits : <leader>c

## Configure

- Open main vim configuration file : ev (Edit Vim)
- Reload configuration : sv (Source Vim)

- test color themes : ':Color', then choose a theme
- keep a color theme : set the theme in the file _appearance.vim_, at the line `execute 'source' g:vvconfpath.'/colors/falcon.vim'
`
