" Vim syntax file
" Language:	config spec file
" Last change:  26/07/2005 erank

" Remove any old syntax stuff hanging around
syn clear

syn keyword element1  element include
" syn region  element2  start="^ "    end="element"
" syn region  element3  start="^ "    end="include"
syn match   file1     "\*"
syn region  file2     start="[ \t]\+"    end="[ \t]\+"
syn region  label1    start="\/main" end="[ \t\n]\+"
syn region  label2    start="[A-Za-z][A-Za-z0-9_]" end="[ \t\n]\+"
syn region  none      start="\-"     end="none[ \t\n]\+"
syn region  comment   start="#"      end="$"


"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

if !exists("did_log_syntax_inits")
  let did_log_syntax_inits = 1
 " The default methods for highlighting.  Can be overridden later

  hi link element1    Element
"  hi link element2    Element
  hi link none        Statement
  hi link file1       Identifier
  hi link file2       Identifier
  hi link label1      Constant
  hi link label2      Constant
  hi link comment     Comment
endif

let b:current_syntax = "config_spec"

" vim: ts=8
