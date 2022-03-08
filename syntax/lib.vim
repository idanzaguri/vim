" Vim syntax file
" Language:	lib, updated for 5.0
" Maintainer:	Adir Zvulun
"	
" Last Update:  Aug 11, 2005
" Filenames:	*.lib
" URL:		"
" 
"
" History:
"		addition to adding them to the deprecated list.

syn clear

" A bunch of useful lib keywords
syn keyword libStatement	technology delay_model library_features
syn keyword libStatement	date nom_process nom_voltage
syn keyword libStatement	nom_temperature voltage_unit
syn keyword libStatement	time_unit
syn keyword libStatement	capacitive_load_unit
syn keyword libStatement	define
syn keyword libStatement	comment
syn keyword libStatement	variable_1 variable_2
syn keyword libStatement        related_pin
syn keyword libStatement        timing_type
syn keyword libStatement        rise_constraint fall_constraint
syn keyword libStatement        dont_use dont_touch interface_timing
syn keyword libStatement        timing_model_type
syn keyword libStatement        base_type data_type bit_width bit_from bit_to
syn keyword libStatement        mode_value
syn keyword libStatement        clock




" bein/end and fork/join stand out a little more than normal statements
syn keyword libLabel           lu_table_template
syn keyword libLabel           type cell mode_definition bus
syn keyword libLabel           pin 
syn keyword libLabel           rise_transition cell_fall cell_rise fall_transition
syn keyword libLabel           timing capacitance direction bus_type




syn keyword libConditional     index_1 index_2 values
syn keyword libRepeat          repeat while for

" predefined lib tasks
" String methods and colibge methods are not listed in the lib.vim file
syn keyword libTask		library

syn keyword libTodo contained TODO

syn match   libOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  libComment start="/\*" end="\*/" contains=libTodo
syn match   libComment "//.*" contains=libTodo

syn match   libGlobal "`[a-zA-Z0-9_]\+\>"
syn match   libGlobal "$[a-zA-Z0-9_]\+\>"

syn match   libConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   libNumber "\(\<[0-9]\+\|\)'[bdh][0-9a-fxzA-FXZ_]\+\>"
syn match   libNumber "\<[+-]\=[0-9]\+\>"

syn region  libString start=+"+  end=+"+

" predefined lib constants
syn keyword libConst	ALL ANY BAD_STATE
syn keyword libConst	BAD_TRANS CALL CHECK
syn keyword libConst	CHGEDGE CLEAR COPY_NO_WAIT
syn keyword libConst	COPY_WAIT CROSS CROSS_TRANS
syn keyword libConst	DEBUG DELETE EC_ARRAYX
syn keyword libConst	EC_CODE_END EC_CONFLICT EC_EVNTIMOUT
syn keyword libConst	EC_EXPECT EC_FULLEXPECT EC_MBXTMOUT
syn keyword libConst	EC_NEXPECT EC_RETURN EC_RGNTMOUT
syn keyword libConst	EC_RHNTMOUT EC_SCONFLICT EC_SEMTMOUT
syn keyword libConst	EC_SEXPECT EC_SFULLEXPECT EC_SNEXTPECT
syn keyword libConst	EC_USERSET EQ EVENT
syn keyword libConst	FAIL FIRST FORK
syn keyword libConst	GE GOAL GT
syn keyword libConst	HAND_SHAKE HI HIGH
syn keyword libConst	HNUM LE LIC_EXIT
syn keyword libConst	LIC_PRERR LIC_PRWARN LIC_WAIT
syn keyword libConst	LO LOAD LOW
syn keyword libConst	LT MAILBOX MAX_COM
syn keyword libConst	NAME NE NEGEDGE
syn keyword libConst	NEXT NO_OVERLAP NO_OVERLAP_TRANS
syn keyword libConst	NO_VARS NO_WAIT NUM
syn keyword libConst	NUM_BIN NUM_DET OFF
syn keyword libConst	OK OK_LAST ON
syn keyword libConst	ONE_BLAST ONE_SHOT ORDER
syn keyword libConst	PAST_IT PERCENT POSEDGE
syn keyword libConst	PROGRAM RAWIN REGION
syn keyword libConst	REPORT SAMPLE SAVE
syn keyword libConst	SEMAPHORE SET SILENT
syn keyword libConst	STATE STR STR_ERR_OUT_OF_RANGE
syn keyword libConst	STR_ERR_REGEXP_SYNTAX SUM TRANS
syn keyword libConst	VERBOSE WAIT 


"copied these from the c.vim file and modified
syn region libPreCondit start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)" skip="\\$" end="$" contains=libComment,libString,libCharacter,libNumber
syn region libIncluded contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match libIncluded contained "<[^>]*>"
syn match libInclude		"^\s*#\s*include\>\s*["<]" contains=libIncluded
syn region libDefine		start="^\s*#\s*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,libPreCondit,libIncluded,libInclude,libDefine,libOperator
syn region libPreProc start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contains=ALLBUT,libPreCondit,libIncluded,libInclude,libDefine


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

