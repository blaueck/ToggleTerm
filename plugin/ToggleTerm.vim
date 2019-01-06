" Vim global plugin for toggle terminal in current tab
" Last Change:  2019/1/6
" Maintainer: blaueck <blaueck@163.com>
" License: None

" term program name(e.g, bash, zsh, powershell), if
" empty, use the default shell option
let g:term_name = get(g:, "term_name", "")

" term height
let g:term_height = get(g:, "term_height", 15)

nnoremap <C-`> :call ToggleTerm#ToggleTerminal()<CR>
augroup toggle_term
  autocmd!
  autocmd TermClose * call ToggleTerm#TerminalCleanUp()
augroup end
