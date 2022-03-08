" Vim syntax file
" Language:	lib, updated for 5.0
" Maintainer:	Adir Zvulun
"	
" Last Update:  Mar 26, 2006
" Filenames:	*.bt_rpt
" URL:		"
" 
"
" History:
"		addition to adding them to the deprecated list.

syn clear

" A bunch of useful lib keywords
syn keyword libStatement        source_clock_domain
syn keyword libStatement        destination_clock_domain




" bein/end and fork/join stand out a little more than normal statements
syn keyword libLabel           Domain from_instance to_instance




syn keyword libConditional     index_1 index_2 values path checks
syn keyword libRepeat          repeat while for

" predefined lib tasks
" String methods and colibge methods are not listed in the lib.vim file
syn keyword libTask		library structural

syn keyword libTodo contained TODO

syn match   libOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  libComment start="/\*" end="\*/" contains=libTodo
syn match   libComment "//.*" contains=libTodo
syn match   libComment "=.*" contains=libTodo
syn match   libComment "--.*" contains=libTodo
syn match   libComment "#.*" contains=libTodo

syn match   libGlobal "`[a-zA-Z0-9_]\+\>"
syn match   libGlobal "$[a-zA-Z0-9_]\+\>"

syn match   libConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   libNumber "\(\<[0-9]\+\|\)'[bdh][0-9a-fxzA-FXZ_]\+\>"
syn match   libNumber "\<[+-]\=[0-9]\+\>"
syn match   libNumber "\/"

syn region  libString start=+"+  end=+"+

" predefined lib constants
syn keyword libConst	STR_ERR_REGEXP_SYNTAX SUM TRANS


"copied these from the c.vim file and modified
syn region libPreCondit start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)" skip="\\$" end="$" contains=libComment,libString,libCharacter,libNumber
syn region libIncluded  contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match  libIncluded  contained "<[^>]*>"
syn match  libInclude		"^\s*#\s*include\>\s*["<]" contains=libIncluded
syn region libDefine		start="^\s*#\s*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,libPreCondit,libIncluded,libInclude,libDefine,libOperator
syn region libPreProc   start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contains=ALLBUT,libPreCondit,libIncluded,libInclude,libDefine


" Add deprecated constructs here.
syn keyword libDeprecated simwave_plot mailbox_send mailbox_receive
syn keyword libDeprecated vhdl_node verilog_node 
syn keyword libDeprecated bind_var get_bind get_bind_id
syn keyword libDeprecated call_func call_task close_conn get_conn_err
syn keyword libDeprecated make_client make_server up_connections

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=75

if !exists("did_lib_syntax_inits")
  let did_lib_syntax_inits = 1
 " The default methods for highlighting.  Can be overridden later

  hi link libCharacter       Character
  hi link libConditional     Conditional
  hi link libRepeat          Repeat
  hi link libString          String
  hi link libTodo            Todo

  hi link libDefine	Macro
  hi link libInclude	Include
  hi link libIncluded	String
  hi link libComment   Comment
  hi link libConstant  Constant
  hi link libLabel     PreCondit
  hi link libPreCondit PreCondit
  hi link libNumber    Special
  " hi link libOperator  Type
  " hi link libOperator  Operator
  " hi link libStatement Statement
  hi link libStatement Type
  hi link libGlobal    String
  hi link libTask	Statement
  hi link libConst	Statement

  hi link libDeprecated	Error
endif

let b:current_syntax = "lib"

" vim: ts=8

