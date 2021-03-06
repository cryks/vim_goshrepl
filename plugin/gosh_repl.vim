"=============================================================================
" FILE: gosh_repl.vim
" AUTHOR:  aharisu <foo.yobina@gmail.com>
" Last Modified: 18 Mar 2012.
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

if exists("loaded_gosh_repl")
  finish
endif
let loaded_gosh_repl = 1

let s:save_cpo = &cpo
set cpo&vim

let g:gosh_enable_ring_history = 
      \ get(g:, 'gosh_enable_ring_history', 1)

let g:gosh_enable_auto_use = 
      \ get(g:, 'gosh_enable_auto_use', 0)

let g:gosh_updatetime = 
      \ get(g:, 'gosh_updatetime', 1000)


command! -nargs=0 GoshREPL :call gosh_repl#ui#open_new_repl()
command! -nargs=0 GoshREPLWithBuffer :call gosh_repl#ui#open_new_repl_with_buffer()
command! -nargs=0 GoshREPLClear :call gosh_repl#ui#clear_buffer()
command! -nargs=1 GoshREPLSend :call gosh_repl#ui#send_text(<q-args>)
command! -nargs=0 GoshREPLLines :call gosh_repl#ui#show_all_line()

vnoremap <silent> <Plug>(gosh_repl_send_block) :call gosh_repl#ui#send_text_block()<CR>


let &cpo = s:save_cpo

