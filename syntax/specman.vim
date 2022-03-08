" Vim syntax file
" Language:	SPECMAN e-language
" Maintainer:	Mike Pedneau <pedneau@verisity.com>
" Last Update:  Wed Dec 09 1998

" Remove any old syntax stuff hanging around
syn clear
"set iskeyword=@,48-57,_,192-255,+,-,?

" autocmd BufNewFile *.e   0r $VIM/.specman.e

" A bunch of useful SPECMAN keywords
syn keyword specmanStatement   out outf append appendf var
syn keyword specmanStatement   on event start expect check that
syn keyword specmanStatement   wait until state machine
syn keyword specmanStatement   cover using count_only trace_only at_least transition item ranges
syn keyword specmanStatement   ignore illegal cross text
syn keyword specmanStatement   print specman is also first only empty with undefined
syn keyword specmanStatement   list of first all compute radix hex instance
syn keyword specmanMethod      post_generate pre_generate setup_test finalize_test extract_test
syn keyword specmanMethod      init run copy as_a set_config pack dut_error add clear lock quit
syn keyword specmanMethod      lock unlock release swap quit to_string value stop_run
syn keyword specmanMethod      crc_8 crc_32 crc_32_flip get_config add0 all_indices and_all
syn keyword specmanMethod      apply average count delete exists first first_index get_indices
syn keyword specmanMethod      has insert is_a_permutation is_empty key key_exists key_index
syn keyword specmanMethod      last last_index max_index max_value min_index
syn keyword specmanMethod      min_value or_all pop pop0 push push0 product resize reverse
syn keyword specmanMethod      size sort split sum top top0 unique clear is_all_iterations
syn keyword specmanMethod      get_enclosing_unit
syn keyword specmanArithMethod abs odd even ilog2 ilog10 ipow isqrt div_round_up min max
syn keyword specmanBitwiseMethod bitwise_op
syn keyword specmanStrMethod   str_split str_chop str_empty str_exactly str_expand_dots
syn keyword specmanStrMethod   str_insensitive str_len str_lower str_pad str_join 
syn keyword specmanStrMethod   str_replace str_split_all str_sub str_upper to_string
syn keyword specmanStrMethod   append appendf bin dec hex quote


syn keyword specmanSpecial     integer real int uint byte bits bit time string locker
syn keyword specmanTemporal    change rise fall delay sync sim true detach eventually emit
syn keyword specmanTemporal    cycle
syn keyword specmanBoolean     TRUE FALSE bool 

syn keyword specmanConditional if then else when #ifdef #ifndef #else
syn keyword specmanConditional case casex casez default 
syn keyword specmanLogical     and or not 
syn keyword specmanRepeat      while for from to step each do break continue
syn keyword specmanRepeat      gen keep keeping soft index it me in new return result select
syn keyword specmanDefine      define as computed type extend struct unit
syn keyword specmanDefine      verilog variable global sys 
syn keyword specmanInclude     import


syn match   specmanOperator    "[&|~><!)(*%@+/=?:;}{,.\^\-\[\]]"
syn match   specmanOperator    "+="

syn match   specmanComment     "//.*" oneline
syn match   specmanComment     "--.*" oneline
syn region  specmanComment     start="'>"hs=s+2 end="<'"he=e-2 

"syn match   specmanHDL         "'[`.a-zA-Z0-9_@]\+\>'"
syn match	specmanHDL			"'\(\(\w\|[`.@]\)\+\)\(\[\d\+\(:\d\+\)*\]\)*'"hs=s+1,he=e-1
"syn match   specmanHDL         "'[`.a-zA-Z0-9_@]\+(\[)\?'"
"syn match   specmanHDL         "'[`.a-zA-Z0-9_@]\+\(\[[0-9]\+\(:[0-9]\+\)\]\)\*\>'"
"syn match   specmanGlobal      "$[a-zA-Z0-9_]\+\>"

"syn match   specmanConstant    "\<[A-Z][A-Z0-9_]\+\>"

syn match   specmanCompare    "==" 
syn match   specmanCompare    "===" 
syn match   specmanCompare    "!=" 
syn match   specmanCompare    ">=" 
syn match   specmanCompare    "<=" 
"syn match   specmanNumber "[0-9]:[0-9]"
syn match   specmanNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   specmanNumber "0[bB]\s*[0-1_xXzZ?]\+\>"
syn match   specmanNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   specmanNumber "0[oO]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   specmanNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   specmanNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   specmanNumber "0[xX]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   specmanNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

"syn match   specmanMethod "\(\<\c\+\)'\s*00\>"
syn match   by_pk_str     "\/\/.*by PK.*"
syn match   by_ym_str     "\/\/.*by YM.*"

syn region  specmanString start=+"+  end=+"+  
"syn region  specmanDefine start="define"  end="{" 



" Idan Zaguri
syn keyword specmanSpecial   simple_port method_port event_port buffer_port indexed_port

syn keyword specmanWiMethod     DUTError
hi link  specmanWiMethod    	Type


set cindent
"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync lines=50

hi link by_pk_str               by_pk
hi link by_ym_str               by_ym
hi link specmanComment     	Comment
hi link	specmanStrMethod	specmanMethod
hi link	specmanArithMethod	specmanMethod
hi link	specmanBitwiseMethod specmanMethod

"hi link Constant 		term=underline ctermfg=DarkRed    guibg=bold       guifg=SeaGreen
hi link specmanConditional	Conditional
hi link specmanRepeat    	Repeat
hi link specmanString      	String
hi link specmanNumber      	Number
hi link specmanCompare     	Operator
hi link specmanOperator     Operator
hi link specmanLogical      Operator
hi link specmanStatement   	Statement
"hi specmanHDL       	term=reverse ctermfg=lightgreen guibg=lightgreen guifg=black
hi link specmanMethod      	Statement
hi link specmanInclude      Include
hi link specmanBoolean		Boolean
hi link specmanSpecial     	Type

hi link  specmanTemporal    Statement  
"hi specmanTemporal      ctermfg=Darkgreen guifg=Darkgreen

hi link specmanDefine       Macro

"hi specmanComment     	term=reverse ctermbg=Yellow ctermfg=Black guibg=Green guifg=Brown
hi link specmanConstant        Constant
"hi specmanSignal        term=reverse ctermbg=Gray ctermfg=black guibg=Gray guifg=black 
let b:current_syntax = "specman"

"set ic
"set ai
"set lines=80

"so ~/.vim/syntax/pk_specman.vim
