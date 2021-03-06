"=============================================================================
" FILE: mapping.vim
" AUTHOR:  aharisu <foo.yobina@gmail.com>
" Last Modified: 29 Apr 2012.
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================

function! gosh_repl#mapping#initialize()

  nnoremap <buffer><expr> <Plug>(gosh_change_line) <SID>change_line()

  nnoremap <buffer><silent> <Plug>(gosh_execute_line) :<C-u>call <SID>execute_line(0)<CR>
  nnoremap <buffer><silent> <Plug>(gosh_insert_head) :<C-u>call <SID>insert_head()<CR>
  nnoremap <buffer><silent> <Plug>(gosh_append_end) :<C-u>call <SID>append_end()<CR>
  nnoremap <buffer><silent> <Plug>(gosh_insert_enter) :<C-u>call <SID>insert_enter()<CR>
  nnoremap <buffer><silent> <Plug>(gosh_append_enter) :<C-u>call <SID>append_enter()<CR>
  nnoremap <buffer><silent> <Plug>(gosh_line_replace_history_prev) :<C-u>call <SID>line_replace_input_history(1)<CR>
  nnoremap <buffer><silent> <Plug>(gosh_line_replace_history_next) :<C-u>call <SID>line_replace_input_history(0)<CR>

  inoremap <buffer><silent> <Plug>(gosh_execute_line) <ESC>:<C-u>call <SID>execute_line(1)<CR>
  inoremap <buffer><expr> <Plug>(gosh_delete_backword_char) <SID>delete_backword_char()
  inoremap <buffer><expr> <Plug>(gosh_delete_backword_char) <SID>delete_backword_char()
  inoremap <buffer><expr> <Plug>(gosh_delete_backword_line) <SID>delete_backword_line()
  inoremap <buffer><silent> <Plug>(gosh_line_replace_history_prev) <ESC>:<C-u>call <SID>line_replace_input_history(1)<CR>:startinsert!<CR>
  inoremap <buffer><silent> <Plug>(gosh_line_replace_history_next) <ESC>:<C-u>call <SID>line_replace_input_history(0)<CR>:startinsert!<CR>

  if exists('g:gosh_no_default_keymappings') && g:gosh_no_default_keymappings
    return
  endif

  nmap <buffer> <CR> <Plug>(gosh_execute_line)
  nmap <buffer> cc <Plug>(gosh_change_line)
  nmap <buffer> dd <Plug>(gosh_change_line)<ESC>
  nmap <buffer> I <Plug>(gosh_insert_head)
  nmap <buffer> A <Plug>(gosh_append_end)
  nmap <buffer> i <Plug>(gosh_insert_enter)
  nmap <buffer> a <Plug>(gosh_append_enter)

  nmap <buffer> <C-p> <Plug>(gosh_line_replace_history_prev)
  nmap <buffer> <C-n> <Plug>(gosh_line_replace_history_next)

  imap <buffer> <CR> <Plug>(gosh_execute_line)
  imap <buffer> <BS> <Plug>(gosh_delete_backword_char)
  imap <buffer> <C-h> <Plug>(gosh_delete_backword_char)
  imap <buffer> <C-u> <Plug>(gosh_delete_backword_line)

  imap <buffer><silent> <C-p> <Plug>(gosh_line_replace_history_prev)
  imap <buffer><silent> <C-n> <Plug>(gosh_line_replace_history_next)

  vmap <buffer> <CR> <Plug>(gosh_repl_send_block)
endfunction

function! s:execute_line(is_insert)"{{{
  let bufnr = bufnr('%')
  let context = gosh_repl#ui#get_context(bufnr)
  let text = gosh_repl#get_line_text(context, line('.'))

  call gosh_repl#ui#execute(text, bufnr, a:is_insert)
endfunction"}}}

function! s:change_line()"{{{
  let context = gosh_repl#ui#get_context(bufnr('%'))
  if context is 0
    return 'ddO'
  endif

  let prompt = gosh_repl#get_prompt(context, line('.'))
  if empty(prompt)
    return 'ddO'
  else
    return printf('0%dlc$', s:strchars(prompt))
  endif
endfunction"}}}

function! s:delete_backword_char()"{{{
  let context = gosh_repl#ui#get_context(bufnr('%'))

  if !pumvisible()
    let prefix = ''
  else
    let prefix = "\<C-y>"
  endif

  let line_num = line('.')
  let line = getline(line_num)
  if len(line) > len(gosh_repl#get_prompt(context, line_num))
    return prefix . "\<BS>"
  else
    return prefix
  endif
endfunction"}}}

function! s:delete_backword_line()"{{{
  if !pumvisible()
    let prefix = ''
  else
    let prefix = "\<C-y>"
  endif

  let line_num = line('.')
  let len = s:strchars(getline(line_num)) - 
        \ s:strchars(gosh_repl#get_prompt(gosh_repl#ui#get_context(bufnr('%')), line_num))

  return prefix . repeat("\<BS>", len)
endfunction"}}}


function! s:insert_head()"{{{
  normal! 0
  call s:insert_enter()
endfunction"}}}

function! s:append_end()"{{{
  call s:insert_enter()
  startinsert!
endfunction"}}}

function! s:append_enter()"{{{
  if col('.') + 1 == col('$')
    call s:append_end()
  else
    normal! l
    call s:insert_enter()
  endif
endfunction"}}}

function! s:insert_enter()"{{{
  let context = gosh_repl#ui#get_context(bufnr('%'))

  let line_num = line('.')
  let prompt = gosh_repl#get_prompt(context, line_num)
  if empty(prompt) && line_num != line('$')
    startinsert
    return
  endif

  let prompt_len = s:strchars(prompt)
  if col('.') <= prompt_len
    if prompt_len + 1 >= col('$')
      startinsert!
      return
    else
      let pos = getpos('.')
      let pos[2] = prompt_len + 1
      call setpos('.', pos)
    endif
  endif

  startinsert
endfunction"}}}

function! s:line_replace_input_history(prev)"{{{
  let context = gosh_repl#ui#get_context(bufnr('%'))
  let lines_len = len(context.lines)
  if lines_len == 0
    return
  endif

  let index = context._input_history_index + ((a:prev == 1) ? 1 : -1)

  if index == 0
    let text = ''
  elseif index > 0
    if index <= lines_len
      let text = context.lines[-index]
    elseif g:gosh_enable_ring_history
      let text = ''
      let index = 0
    endif
  elseif g:gosh_enable_ring_history " index < 0
    let index = lines_len
    let text = context.lines[-index]
  endif

  if exists('text')
    let line_num = line('.')

    call setline(line_num, gosh_repl#get_prompt(context, line_num) . text)
    let context._input_history_index = index
  endif
endfunction"}}}

"
"Util

"from vital.vim plugin s:strchars"{{{
function! s:strchars(str)
  return strlen(substitute(copy(a:str), '.', 'x', 'g'))
endfunction"}}}

" vim: foldmethod=marker
