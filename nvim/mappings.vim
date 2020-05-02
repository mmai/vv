let g:mapleader="\<Space>"
let g:maplocalleader=';'

"ESC remap
inoremap kj <esc>
inoremap KJ <esc>
inoremap jk <esc>
inoremap JK <esc>

"Easy vimrc editing
nnoremap <expr> ,ev ':vsplit '.g:vvconfpath.'/init.vim'. "\n"
nnoremap <expr> ,sv ':source '.g:vvconfpath.'/init.vim'. "\n"

" ,cd => change directory to the file being edited
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"delete buffer
nnoremap <C-x> :<C-u>bd<CR>

" choosewin
nnoremap ù :ChooseWin<CR>

" ------ UI ------------
" Open sidebar file browser
"nnoremap <leader>e :CocCommand explorer<CR> 
nnoremap <leader>e :Defx<CR>
" browse tags 
nnoremap <leader>t :Vista coc<CR>
" browse current file directory
if $VIMCONF == 'all'
  nnoremap - :LfCurrentDirectory<CR>
endif

if $VIMCONF == 'all'
  " ------ Completion with Coc ---------
  "Use tab for trigger completion with characters ahead and navigate
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction


  " ---------  Coc ------------------
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>ci <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
endif
