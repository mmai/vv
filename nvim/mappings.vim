"let g:mapleader="\<Space>"
let g:mapleader=","
let g:maplocalleader=';'

"ESC remap
inoremap kj <esc>
inoremap KJ <esc>
inoremap jk <esc>
inoremap JK <esc>

"Easy vimrc editing
nnoremap <expr> <leader>ev ':vsplit '.stdpath('config').'/init.vim'. "\n"
nnoremap <expr> <leader>sv ':source '.stdpath('config').'/init.vim'. "\n"

" ,cd => change directory to the file being edited
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
