" Vim syntax file
" Language:	Verilog
" Maintainer:	Mun Johl <mun_johl@sierralogic.com>
" Last Update:  Tue Jun  7 14:27:10 PDT 2005

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

" A bunch of useful Verilog keywords

syn keyword verilogStatement   always and assign automatic buf
syn keyword verilogStatement   bufif0 bufif1 cell cmos
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable edge endconfig
syn keyword verilogStatement   endfunction endgenerate endmodule
syn keyword verilogStatement   endprimitive endspecify endtable endtask
syn keyword verilogStatement   event force function
syn keyword verilogStatement   generate genvar highz0 highz1 ifnone
syn keyword verilogStatement   incdir include initial inout input
syn keyword verilogStatement   instance integer large liblist
syn keyword verilogStatement   library localparam macromodule medium
syn keyword verilogStatement   module nand negedge nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1 or
syn keyword verilogStatement   output parameter pmos posedge primitive
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   rcmos real realtime release
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled signed small
syn keyword verilogStatement   specify specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table task time tran
syn keyword verilogStatement   tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogStatement   trior trireg unsigned use vectored wait
syn keyword verilogStatement   wand weak0 weak1 wire wor xnor xor
syn keyword verilogLabel       begin end fork join
syn keyword verilogConditional if else case casex casez default endcase
syn keyword verilogConditional reg endreg constraint endconstraint  gu endgu
syn keyword verilogRepeat      forever repeat while for

syn keyword verilogTodo contained TODO

syn match   verilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,@Spell
syn match   verilogComment "//.*" contains=verilogTodo,@Spell

"syn match   verilogGlobal "`[a-zA-Z0-9_]\+\>"
syn match verilogGlobal "`celldefine"
syn match verilogGlobal "`default_nettype"
syn match verilogGlobal "`define"
syn match verilogGlobal "`else"
syn match verilogGlobal "`elsif"
syn match verilogGlobal "`endcelldefine"
syn match verilogGlobal "`endif"
syn match verilogGlobal "`ifdef"
syn match verilogGlobal "`ifndef"
syn match verilogGlobal "`include"
syn match verilogGlobal "`line"
syn match verilogGlobal "`nounconnected_drive"
syn match verilogGlobal "`resetall"
syn match verilogGlobal "`timescale"
syn match verilogGlobal "`unconnected_drive"
syn match verilogGlobal "`undef"
syn match   verilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   verilogConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   verilogNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   verilogNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   verilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  verilogString start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape +\\[nt"\\]+ contained
syn match   verilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
   if version < 508
      let did_verilog_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink verilogCharacter       Character
   HiLink verilogConditional     Conditional
   HiLink verilogRepeat		 Repeat
   HiLink verilogString		 String
   HiLink verilogTodo		 Todo
   HiLink verilogComment	 Comment
   HiLink verilogConstant	 Constant
   HiLink verilogLabel		 Label
   HiLink verilogNumber		 Number
   HiLink verilogOperator	 Special
   HiLink verilogStatement	 Statement
   HiLink verilogGlobal		 Define
   HiLink verilogDirective	 SpecialComment
   HiLink verilogEscape		 Special

   delcommand HiLink
endif

let b:current_syntax = "verilog"

" vim: ts=8
