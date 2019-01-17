function! g:ToggleTerm#ToggleTerminal()
  let cterm_name = &shell
  if g:term_name != ''
    let cterm_name = g:term_name
  endif

  let wid = -1
  if exists("t:tab_term_buf_name")
    let wid = bufwinid(t:tab_term_buf_name)
  endif
  if wid != -1
    let cid = win_getid()
    if cid == wid
      hide
    else
      call win_gotoid(wid)
      normal i
    endif
  else
    new
    exec "normal \<C-W>J"
    exec "resize " . g:term_height
    if exists("t:tab_term_buf_name")
      let bn = bufnr(t:tab_term_buf_name)
      exec "buffer " . bn
    else
      let t:tab_term_job_id = termopen(cterm_name)
      let t:tab_term_buf_name = bufname("%") 
      let b:is_toggle_term = v:true
      setlocal nobuflisted
    endif
    normal i
  endif
endfunction

function! g:ToggleTerm#TerminalCleanUp()
  if exists("b:is_toggle_term")
    unlet t:tab_term_buf_name
    unlet t:tab_term_job_id
  endif
endfunction

function! g:ToggleTerm#TermSend(data)
  if exists("t:tab_term_buf_name")
    call chansend(t:tab_term_job_id, a:data)
  endif
endfunction

function! g:ToggleTerm#TermSendReg(regname)
  call g:ToggleTerm#TermSend(getreg(a:regname))
endfunction
