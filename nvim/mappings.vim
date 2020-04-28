let g:mapleader="\<Space>"
let g:maplocalleader=';'

"ESC remap
inoremap kj <esc>
inoremap KJ <esc>
inoremap jk <esc>
inoremap JK <esc>

"Easy vimrc editing
nnoremap <expr> ,ev ':vsplit '.stdpath('config').'/init.vim'. "\n"
nnoremap <expr> ,sv ':source '.stdpath('config').'/init.vim'. "\n"

" ,cd => change directory to the file being edited
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" ------ UI ------------
" Open sidebar file browser
"nnoremap <leader>e :CocCommand explorer<CR> 
nnoremap <leader>e :Defx<CR>
