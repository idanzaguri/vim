" Vim syntax file
" Language:	Status file
" Last change:  09/03/2000 erank

" Remove any old syntax stuff hanging around
syn clear

"syn match   run   "\<[running]i\>"
syn keyword run   RUNNING runing 
syn keyword pass  PASSED passed P_A_S_S_E_D OK
syn keyword fail  FAILED failed FAIL 
syn keyword error ERROR Error error 
syn keyword ended ENDED ended
syn sync    lines=50

if !exists("did_log_syntax_inits")
  let did_log_syntax_inits = 1
  hi link run      Run
  hi link fail     Fail
  hi link pass     Pass
  hi link ended    Ended
  hi link error    Error3
endif

let b:current_syntax = "status"

" vim: ts=8
