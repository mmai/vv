" WRITING

" default spelling languages
set spelllang=fr,en_us

let g:languagetool_jar= '/usr/local/LanguageTool/LanguageTool.jar'

" enable toggle checkbox on markdown files (enabled by default in vim-mardown but was disabled by polyglot plugin)
let g:markdown_enable_mappings = 1

" Goyo Distraction free writing
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  " disable coc (ie git signs)
  silent! CocDisable
  set showtabline=0 " disable vim-buffet tab bar
  let g:loaded_spaceline=0 " disable spaceline status bar
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  silent! CocEnable
  set showtabline=2
  let g:loaded_spaceline =1
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
