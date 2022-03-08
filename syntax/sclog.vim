" Vim syntax file
" Language:	Configuration File for SC140 log file
" Maintainer:	Rotem Porat (rotemp@motorola.com)
" Last Change:	2003 May 14
" Version Info: @(#)sclog.vim	1.131 
" 
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

syn keyword sclogMonitor MAIN AGU CLK EONCE PAG PCU PDP DALU MEM 
syn match   sclogMemRd	/MEM_READ.*/
syn match   sclogMemWr	/MEM_WRITE.*/
syn match   sclogMnem	/EX_SET.*/ contains=sclogDasmPr
syn match   sclogMnem	/MAC1:.*/  contains=sclogDasmPr
"syn match   sclogRegWr	/REG_\(WRITE\|CHANGE\).*/ contains=sclogRegErr,sclogBitErr
syn match   sclogPC	/PC_CHANGE.*/
syn match   sclogComment /\/\?\*.*/
syn match   sclogRAS	/PUSH_RA. .*/
syn match   sclogRsgPDB	/PDB\s*is.*/
syn match   sclogStall	/\d CYCLE STALL.*/
syn match   sclogErr	/\cERROR.*/
syn match   sclogErr	/REDUCE_MUX.*/
syn match   sclogRegWr	/\s\{2,}\S*\s*=\s\+[0-9a-f_Xx]*\s\+\(\S*\[\d\+\]=[0-9a-f_Xx]*\)*/ contains=sclogRegErr,sclogBitErr 
syn match   sclogRegErr	/\s\{2,}\S*\s*=\s*[0-9a-f_]*[Xx]\+[0-9a-f_Xx]*/ contained
syn match   sclogBitErr	/\s\S*\[\d\]=[Xx]/ contained
syn match   sclogWarn	/\cWARNING/
syn match   sclogDasmPr /disassembly problem!/ contained
syn match   sclogDue    /DUE TO .*/

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sclog_syntax_inits")
  if version < 508
    let did_sclog_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

	HiLink sclogMonitor	Type
	HiLink sclogMemRd	Constant
	HiLink sclogMemWr	Constant	
	HiLink sclogMnem	PreProc
	HiLink sclogRegWr	Statement
	HiLink sclogPC		Identifier	
	HiLink sclogComment	Comment
	HiLink sclogRAS		Special
	HiLink sclogRsgPDB	Special
	HiLink sclogStall	Special
	HiLink sclogErr		Error	
	HiLink sclogWarn	Error
	HiLink sclogRegErr	Error	
	HiLink sclogBitErr	Error
	hi sclogDasmPr gui=italic ctermfg=red guifg=red

  delcommand HiLink
endif

let b:current_syntax = "sclog"

" vim:ts=8
