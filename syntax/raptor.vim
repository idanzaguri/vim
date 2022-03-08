" Vim syntax file
" Language:	raptor, 
" Maintainer:	Weiss Nir	(work)<rm96501@freescale.com>
" Last Update:  Januar 07, 2005
" Filenames:	*.rmf
"
"

syn clear

" A bunch of useful raptor keywords
syn keyword raptorStatement	asm const
syn keyword raptorStatement	fun global hash 
syn keyword raptorStatement	macro null println getenv
syn keyword raptorStatement	random return rhex str setw uniform var 




" bein/end and fork/join stand out a little more than normal statements
syn keyword raptorLabel           begin end fork join
syn keyword raptorConditional     if else elsif 
syn keyword raptorRepeat          rep do while for break 

" predefined raptor tasks
" String methods and coverage methods are not listed in the raptor.vim file
syn keyword raptorTask		initMem initDevice setMem setDevice setConsTries
syn keyword raptorTask		initReg setReg setEvent isRegInit memValue rhex setMemReserved
syn keyword raptorTask		isrange isstring islist

syn keyword raptorTodo contained TODO

syn match   raptorOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  raptorComment start="/\*" end="\*/" contains=raptorTodo
syn match   raptorComment "//.*" contains=raptorTodo

syn match   raptorGlobal "`[a-zA-Z0-9_]\+\>"
syn match   raptorGlobal "$[a-zA-Z0-9_]\+\>"

syn match   raptorConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   raptorNumber "\(\<[0-9]\+\|\)'[bdh][0-9a-fxzA-FXZ_]\+\>"
syn match   raptorNumber "\(\<[0-9]\+\|\)x[0-9a-fA-F_]\+\>"
syn match   raptorNumber "\<[+-]\=[0-9]\+\>"

syn region  raptorString start=+"+  end=+"+

" predefined raptor constants
syn keyword raptorConst	NULL


"copied these from the c.vim file and modified
syn region raptorPreCondit start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)" skip="\\$" end="$" contains=raptorComment,raptorString,raptorCharacter,raptorNumber
syn region raptorIncluded contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match raptorIncluded contained "<[^>]*>"
syn match raptorInclude		"^\s*#\s*include\>\s*["<]" contains=raptorIncluded
syn region raptorDefine		start="^\s*#\s*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,raptorPreCondit,raptorIncluded,raptorInclude,raptorDefine,raptorOperator
syn region raptorPreProc start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contains=ALLBUT,raptorPreCondit,raptorIncluded,raptorInclude,raptorDefine


" Add deprecated constructs here.
syn keyword raptorDeprecated vhdl_node verilog_node 

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=75

if !exists("did_raptor_syntax_inits")
  let did_raptor_syntax_inits = 1
 " The default methods for highlighting.  Can be overridden later

   hi link raptorCharacter       Character
"  hi link raptorConditional     Conditional
   hi link raptorRepeat          Repeat
"  hi link raptorString          String
   hi link raptorTodo            Todo

"  hi link raptorDefine	Macro
"  hi link raptorInclude	Include
"  hi link raptorIncluded	String
   hi link raptorComment   Comment
   hi link raptorConstant  Constant
   hi link raptorLabel     PreCondit
   hi link raptorPreCondit PreCondit
"  hi link raptorNumber    Special
"  hi link raptorOperator  Type
"  hi link raptorOperator  Operator
   hi link raptorAsm  	   Type
   hi link raptorStatement Statement
   hi link raptorStatement Type
"  hi link raptorGlobal    String
   hi link raptorTask	Statement
   hi link raptorConst	Statement

   hi link raptorDeprecated	Error
endif

let b:current_syntax = "raptor"

" vim: ts=8

