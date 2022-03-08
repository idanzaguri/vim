" Vim syntax file
" Language:	Configuration File for SC140 ref file
" Maintainer:	Rotem Porat (rotemp@motorola.com)
" Last Change:	2003 May 28
" Version Info: @(#)scref.vim	1.10 
" 
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn match   screfComment  /;\(\-\| Tool\| Args\| User\| Rsgsc100\|\s*Using:\| Asmsc100\).*/
syn match   screfComment  /\(CHANGE\|IMC=\).*/
syn match   screfComment  /RESET \(events\|completed\)/
syn match   screfExCyc    /\`\d\+/
syn match   screfOpcode   / \[[0-9a-f ]\+\]/  contains=n1wp,o1wp,2wp
syn match   screfVLES     / = .\{-}\($\|;\)/ 
syn match   screfPC	  /pc= [0-9a-f_]\+/
syn match   screfRegWr	  /[a-z0-9_]\+=\s\s\+[0-9a-f_]\+/
syn match   screfMemWr	  /([a-z0-9]\+)\..=\s*[0-9a-f_]\+/
syn match   screfFetchSet /FETCH_SET.*/
syn match   scref_n1wp 	  /\[9[13579bdf][cd][0-9a-f]/hs=s+1 "new one word prefix
syn match   scref_o1wp 	  /\[9[02468ace][cd][0-9a-f]/hs=s+1 "old one word prefix
syn match   scref_2wp  	  /\[3[02468ace][0-9a-f]\{2\} [ab][0-9a-f]\{3\}/hs=s+1 "two word prefix



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_scref_syntax_inits")
  if version < 508
    let did_scref_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

	HiLink screfComment	Comment
	HiLink screfExCyc	Special	
"	HiLink screfOpCode	Type
	HiLink screfVLES	PreProc
	HiLink screfPC		Identifier	
	HiLink screfRegWr	Statement
	HiLink screfMemWr	Constant
	HiLink screfFetchSet	Special	

	HiLink scref_2wp	Comment
	HiLink scref_o1wp	Comment
	HiLink scref_n1wp	Type
	
  delcommand HiLink
endif

let b:current_syntax = "scref"

" vim:ts=8
