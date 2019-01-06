function! g:ToggleTerm#ToggleTerminal()
  let cterm_name = &shell
  if g:term_name != ''
    let cterm_name = g:term_name
  endif

  let wid = bufwinid('*' . cterm_name) 
  if wid != -1
    let cid = win_getid()
    if cid == wid
      hide
    else
      call win_gotoid(wid)
    endif
  else
    exec "new"
    exec "normal \<C-W>J"
    exec "resize " . g:term_height
    if exists("t:tab_term_buf_name")
      let bn = bufnr(t:tab_term_buf_name)
      exec "buffer " . bn
    else
      call termopen(cterm_name)
      let t:tab_term_buf_name = bufname("%") 
      let b:is_toggle_term = v:true
    endif
  endif
endfunction

function! g:ToggleTerm#TerminalCleanUp()
  if exists("b:is_toggle_term")
    unlet t:tab_term_buf_name
  endif
endfunction
