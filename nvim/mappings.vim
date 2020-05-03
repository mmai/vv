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

" Save with sudo
cmap W!! w !sudo tee % >/dev/null

"delete buffer
nnoremap <C-x> :<C-u>bd<CR>

" choosewin
nnoremap ù :ChooseWin<CR>

"--------------- Personal wiki ----------------
" Space + Enter : open markdown wiki links in a new split
nnoremap <Space><CR> <C-w>v:MdwiGotoLink<CR>

" ------- FZF Fuzzy-find plugin shortcuts
let $FZF_DEFAULT_COMMAND = 'fd --type f'
let $FZF_CTRL_T_COMMAND  = 'fd --type f'
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>
" View commits in fzf
nmap <Leader>c :Commits<cr>


" ------ UI ------------
" Open sidebar file browser
"nnoremap <leader>e :CocCommand explorer<CR> 
if $VIMCONF == 'all'
  nnoremap <leader>e :Defx<CR>
else
  nnoremap <leader>e :NERDTreeToggle<CR>
endif

if $VIMCONF == 'all'
  " browse tags 
  nnoremap <leader>t :Vista coc<CR>
  " browse current file directory with lf
  nnoremap - :LfCurrentDirectory<CR>
else
  " browse tags 
  nnoremap <leader>t :Vista<CR>
endif

" undo tree
nnoremap <silent> <Leader>u :MundoToggle<CR>

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
  " Remap for do codeAction of selected region
  function! s:cocActionsOpenFromSelected(type) abort
	  execute 'CocCommand actions.open ' . a:type
  endfunction
  xmap <silent> <Leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
  nmap <silent> <Leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
  " Do default action for next item.
  nnoremap <silent> <Leader>cn  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <Leader>cp  :<C-u>CocPrev<CR>
  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <Leader>ce  :<C-u>CocList diagnostics<cr>
  " Search workspace symbols
  nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>
  " Resume latest coc list
  nnoremap <silent> <Leader>'  :<C-u>CocListResume<CR>
  " Use `[e` and `]e` for navigate diagnostics
  nmap <silent> ]e <Plug>(coc-diagnostic-prev)
  nmap <silent> [e <Plug>(coc-diagnostic-next)
  " Remap for rename current word
  nmap <Leader>cr <Plug>(coc-rename)
  " Remap for format selected region
  vmap <Leader>cf  <Plug>(coc-format-selected)
  nmap <Leader>cf  <Plug>(coc-format-selected)
  " Fix autofix problem of current line
  nmap <Leader>cF  <Plug>(coc-fix-current)
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>ci <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use K for show documentation in float window
  nnoremap <silent> K :call CocActionAsync('doHover')<CR>
  nnoremap <silent> <Leader>cd :call CocActionAsync('doHover')<CR>
  " use <c-space> for trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  nmap ]g <Plug>(coc-git-prevchunk)
  nmap [g <Plug>(coc-git-nextchunk)
  " show chunk diff at current position
  nmap <Leader>gi <Plug>(coc-git-chunkinfo)
  " show commit contains current position
  nmap <Leader>gm <Plug>(coc-git-commit)
  " float window scroll
  nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
  nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
  " Use <TAB> for selections ranges.
  " NOTE: Requires 'textDocument/selectionRange' support from the language server.
  " coc-tsserver, coc-python are the examples of servers that support it.
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
  nnoremap <silent> <Leader>co :<C-u>OR<CR>
  " multiple cursors
  nmap <silent> <C-c> <Plug>(coc-cursors-position)
  nmap <expr> <silent> <C-m> <SID>select_current_word()
  xmap <silent> <C-d> <Plug>(coc-cursors-range)
  " use normal command like `<Leader>xi(`
  nmap <Leader>x  <Plug>(coc-cursors-operator)

  function! s:select_current_word()
	  if !get(g:, 'coc_cursors_activated', 0)
		  return "\<Plug>(coc-cursors-word)"
	  endif
	  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
  endfunc
  " Use `:Format` for format current buffer
  command! -nargs=0 Format :call CocAction('format')

  nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
  " use normal command like `<Leader>xi(`
  nmap <Leader>x  <Plug>(coc-cursors-operator)
  " coc-explorer
  noremap <silent> <Leader>o :execute 'CocCommand explorer' .
			  \ ' --toggle' .
			  \ ' --position=floating' .
			  \ ' --sources=file+'<CR>
  " Introduce function text object
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

endif
