if $VIMCONF == 'all'
  " ------ lf plugin
  let g:lf_replace_netrw = 1 " open lf when vim open a directory
endif

" ----------- MARKDOWN-------------------------
" Disable line numbers in markdown
autocmd FileType markdown setlocal nonumber

" plasticboy/vim-markdown settings
let g:vim_markdown_folding_level = 4
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_fenced_languages = [
			\ 'c++=cpp',
			\ 'viml=vim',
			\ 'bash=sh',
			\ 'ini=dosini',
			\ 'js=javascript',
			\ 'json=javascript',
			\ 'jsx=javascriptreact',
			\ 'tsx=typescriptreact',
			\ 'docker=Dockerfile',
			\ 'makefile=make',
			\ 'py=python'
			\ ]
" toggle checkboxes in markdown files (code from gabrielelana/vim-markdown)
" {{{ SWITCH STATUS
function! behaviour#SwitchStatus()
  let current_line = getline('.')
  if match(current_line, '^\s*[*\-+] \[ \]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[ \]', '\1 [x]', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \[x\]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[x\]', '\1', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \(\[[x ]\]\)\@!') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\)', '\1 [ ]', ''))
    return
  endif
  if match(current_line, '^\s*#\{1,5}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*#\{1,5}\) \(.*$\)', '\1# \2', ''))
    return
  endif
  if match(current_line, '^\s*#\{6}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*\)#\{6} \(.*$\)', '\1# \2', ''))
    return
  endif
endfunction
" }}}
