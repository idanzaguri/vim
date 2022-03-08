" Vim syntax file
" Language:	metadata
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

" A bunch of useful metadata keywords

syn keyword metadataStatement   dn :
syn keyword metadataStatement   wand weak0 weak1 wire wor xnor xor
syn keyword metadataLabel       begin end fork join
syn keyword metadataConditional if else case casex casez default endcase
syn keyword metadataRepeat      forever repeat while for

syn keyword metadataTodo contained TODO

"syn match   metadataOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  metadataComment start="/\*" end="\*/" contains=metadataTodo,@Spell
syn match   metadataComment "^#.*" contains=metadataTodo,@Spell

"syn match   metadataGlobal "`[a-zA-Z0-9_]\+\>"
syn match metadataGlobal "_ORIGIN"
syn match metadataGlobal "_TYPE"
syn match metadataGlobal "PDK_NAME"
syn match metadataGlobal "SHRINK_FACTOR"
syn match metadataGlobal "SUPPLY_NAME"
syn match metadataGlobal "CELLSETS"
syn match metadataGlobal "DESIGN_POINT"
syn match metadataGlobal "DESIGN_SUPPLIES"
syn match metadataGlobal "LIBRARY"
syn match metadataGlobal "METAL_OPTION"
syn match metadataGlobal "MU_NUMBER"
syn match metadataGlobal "TOP_BLOCK_FIRST"
syn match metadataGlobal "PROCESS"
syn match metadataGlobal "PVT_MODE"
syn match metadataGlobal "TEMPERATURE"
syn match metadataGlobal "VOLTAGE"
syn match metadataGlobal "CURRENT_TESTER"
syn match metadataGlobal "ldif-ref-isrel"
syn match metadataGlobal "ldif-ref-path"
syn match metadataGlobal "HDL_ROOT"
syn match metadataGlobal "VIEW"
syn match metadataGlobal "FPGA_VIEW"
syn match metadataGlobal "FPGA_FILE_LIST"
syn match metadataGlobal "FPGA_HDL_EXCLUDE_FILE_LIST"
syn match metadataGlobal "PHYSICAL_VIEW"
syn match metadataGlobal "PHASE"
syn match metadataGlobal "USER_CELLS"
syn match metadataGlobal "HDL_FILE_LIST"
syn match metadataGlobal "TIMING_TOOL"
syn match metadataGlobal "TIMING_MODE"
syn match metadataGlobal "SUBBLOCK_ORDER"
syn match metadataGlobal "CONFIGURATION"
syn match metadataGlobal "INSTANCE_NAME"
syn match metadataGlobal "DO_HIERARCHICAL_BA"
syn match metadataGlobal "PROJECT_NAME"
syn match metadataGlobal "ldif-link-address"
syn match metadataGlobal "CURRENT_CM_SYSTEM"
syn match metadataGlobal "REPOSITORY_LIST"
syn match metadataGlobal "ROUTING_LAYERS"
syn match metadataGlobal "ROUTING_LAYER_NAMES"
syn match metadataGlobal "SHORT_ID"
syn match metadataGlobal "PARAM_INDEX"
syn match metadataGlobal "`[a-zA-Z0-9_]\+"
syn match metadataGlobal "$[a-zA-Z0-9_]\+\>"

"syn match   metadataConstant "\<[A-Z][A-Z0-9_]\+\>"

syn match   metadataNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   metadataNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   metadataNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   metadataNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   metadataNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn region  metadataString start=+"+ skip=+\\"+ end=+"+ contains=metadataEscape,@Spell
syn match   metadataEscape +\\[nt"\\]+ contained
syn match   metadataEscape "\\\o\o\=\o\=" contained

" Directives
syn match   metadataDirective   "//\s*synopsys\>.*$"
syn region  metadataDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  metadataDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   metadataDirective   "//\s*\$s\>.*$"
syn match   metadataDirective   "bc/subBlocks/.*"
syn match   metadataDirective   "design/.*"
syn match   metadataDirective   "technologies.*"
syn match   metadataDirective   "\S*/cellSets.*"
syn match   metadataDirective   "\S*/supplies.*"
syn match   metadataDirective   "\S*/metaloptions.*"
syn match   metadataDirective   "repositories.*"
syn region  metadataDirective   start="/\*\s*\$s\>" end="\*/"
syn region  metadataDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_metadata_syn_inits")
   if version < 508
      let did_metadata_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

   " The default highlighting.
   HiLink metadataCharacter      Character
   HiLink metadataConditional    Conditional
   HiLink metadataRepeat	 Repeat
   HiLink metadataString	 String
   HiLink metadataTodo		 Todo
   HiLink metadataComment	 Comment
   HiLink metadataConstant	 Constant
   HiLink metadataLabel		 Label
   HiLink metadataNumber	 Number
   HiLink metadataOperator	 Special
   HiLink metadataStatement	 Statement
   HiLink metadataGlobal	 Define
   HiLink metadataDirective	 SpecialComment
   HiLink metadataEscape	 Special

   delcommand HiLink
endif

let b:current_syntax = "metadata"

" vim: ts=8
