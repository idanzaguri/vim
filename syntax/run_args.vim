" Vim syntax file
" Language: ccf
" Maintainer:   Adir Zvulun <adir@freescale.com>
" Last Update:  Jan  30 2008

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" A bunch of useful ccf keywords

"syn keyword ccfStatement   bufif0 bufif1 cell cmos
"syn keyword ccfLabel       begin end fork join
"syn keyword ccfConditional if else case casex casez default endcase
"syn keyword ccfRepeat      forever repeat while for

syn keyword ccfTodo contained TODO

"syn match   ccfOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

"syn region  ccfComment start="/\*" end="\*/" contains=ccfTodo,@Spell
syn match   ccfComment "#.*" contains=ccfTodo,@Spell

"syn match   ccfGlobal "`[a-zA-Z0-9_]\+\>"
"syn match ccfGlobal "`define"

syn match   ccfConstant "^\s*-[a-zA-Z0-9_]\+\s*="

"syn match   ccfNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

"syn region  ccfString start=+"+ skip=+\\"+ end=+"+ contains=ccfEscape,@Spell
"syn match   ccfEscape +\\[nt"\\]+ contained
"syn match   ccfEscape "\\\o\o\=\o\=" contained

" Directives
"syn match   ccfDirective   "//\s*\$s\>.*$"
"syn region  ccfDirective   start="/\*\s*\$s\>" end="\*/"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ccf_syn_inits")
   if version < 508
      let did_ccf_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink ccfCharacter       Character
   HiLink ccfConditional     Conditional
   HiLink ccfRepeat          Repeat
   HiLink ccfString          String
   HiLink ccfTodo            Todo
   HiLink ccfComment         Comment
   HiLink ccfConstant        Constant
   HiLink ccfLabel           Label
   HiLink ccfNumber          Number
   HiLink ccfOperator        Special
   HiLink ccfStatement       Statement
   HiLink ccfGlobal          Define
   HiLink ccfDirective       SpecialComment
   HiLink ccfEscape          Special

   delcommand HiLink
endif

let b:current_syntax = "ccf"

" vim: ts=8
