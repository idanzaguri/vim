" Vim syntax file
"
" Language:		NATURAL
" Version:		2.26.005
" Maintainer:	Marko Leipert <vim@mleipert.de>
" Last Changed:	2001-07-26 09:48:00
" Support:		http://www.winconsole.de/vim/syntax.html


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when this syntax file was already loaded
if v:version < 600
	syntax clear
	set iskeyword+=-,*,#,+,_,/
elseif exists("b:current_syntax")
	finish
else
	setlocal iskeyword+=-,*,#,+,_,/
endif

" NATURAL is case insensitive
syntax case ignore

" preprocessor
syn keyword naturalInclude		include nextgroup=naturalObjName skipwhite

" define data
syn keyword naturalKeyword		define data end-define
syn keyword naturalKeyword		independent global parameter local redefine view
syn keyword naturalKeyword		const[ant] init initial

" loops
syn keyword naturalLoop			read end-read end-work find end-find histogram end-histogram
syn keyword naturalLoop			end-all sort end-sort sorted descending ascending
syn keyword naturalRepeat		repeat end-repeat while until for step end-for
syn keyword naturalKeyword		in file with field starting from ending at thru by isn where
syn keyword naturalError		on error end-error
syn keyword naturalKeyword		accept reject end-enddata number retain as release
syn keyword naturalKeyword		start end-start break end-break skip physical page top sequence
syn keyword naturalKeyword		end-toppage end-endpage end-endfile before processing
syn keyword naturalKeyword		end-before

" conditionals
syn keyword	naturalConditional	if then else end-if end-norec
syn keyword	naturalConditional	decide end-decide value when condition none any

" assignment / calculation
syn keyword naturalKeyword		reset assign move left right justified compress to into edited
syn keyword naturalKeyword		add subtract multiply divide compute name
syn keyword naturalKeyword		all giving remainder rounded leaving space
syn keyword naturalKeyword		examine full replace giving separate delimiter modified
syn keyword naturalKeyword		suspend identical suppress

" program flow
syn keyword naturalFlow			callnat fetch return escape bottom top stack formatted
syn keyword naturalFlow			command call
syn keyword naturalflow			end-subroutine routine

" file operations
syn keyword naturalKeyword		update store get delete end transaction work once close

" other keywords
syn keyword naturalKeyword		first every of no record[s] found ignore immediate
syn keyword naturalKeyword		set settime key control stop terminate

" in-/output
syn keyword naturalKeyword		write display input reinput notitle nohdr map newpage mark
syn keyword naturalKeyword		alarm text help eject index
syn keyword naturalKeyword		format printer

" functions
syn keyword naturalKeyword		val old

" report mode keywords
syn keyword naturalRMKeyword	same loop obtain indexed do doend

" Subroutine name
syn keyword	naturalFlow			perform subroutine nextgroup=naturalFunction skipwhite
syn match	naturalFunction		"\<[a-z][-_a-z0-9]*\>"

syn keyword	naturalFlow			using nextgroup=naturalKeyword,naturalObjName skipwhite
syn match	naturalObjName		"\<[a-z][-_a-z0-9]\{,7}\>"

" Labels
syn match	naturalLabel		"\<[+#a-z][-_#a-z0-9]*\."
syn match	naturalRef			"\<[+#a-z][-_#a-z0-9]*\>\.\<[+#a-z][-_#a-z0-9]*\>"

" System variables
syn match	naturalSysVar		"\<\*[a-z][-a-z0-9]*\>"

"integer number, or floating point number without a dot.
syn match	naturalNumber		"\<-\=\d\+\>"
"floating point number, with dot
syn match	naturalNumber		"\<-\=\d\+\.\d\+\>"
"floating point number, starting with a dot
syn match	naturalNumber		"\.\d\+"

" Formats in write statement
syn match	naturalFormat		"\<\d\+[TX]\>"

" String and Character contstants
syn match	naturalString		"H'\x\+'"
syn region  naturalString		start=+"+ end=+"+
syn region	naturalString		start=+'+ end=+'+

" Type definition
syn match	naturalAttribute	"\<[-a-z][a-z]=[-a-z0-9_\.]\+\>"
syn match	naturalType			contained "\<[ANIP]\d\+\(,\d\+\)\=\>"
syn match	naturalType			contained "\<[CL]\>"

" TODO / other comments
syn keyword naturalTodo			contained todo test
syn match	naturalCommentMark	contained "[a-z][^ \t/:|]*\(\s[^ \t/:|]\+\)*:\s"he=e-1

" comments
syn region	naturalComment		start="/\*" end="$" contains=naturalTodo,naturalLineRef,naturalCommentMark
syn region	naturalComment		start="^\*[\ \*]" end="$" contains=naturalTodo,naturalLineRef,naturalCommentMark
syn region	naturalComment		start="^\d\{4} \*[\ \*]"lc=5 end="$" contains=naturalTodo,naturalLineRef,naturalCommentMark
syn match	naturalComment		"^*$"
syn match	naturalComment		"^\d\{4} \*$"lc=5
" /* is legal syntax in parentheses e.g. #ident(label./*)
syn region	naturalPComment		contained start="/\*\s*[^)]"  end="$" contains=naturalTodo,naturalLineRef,naturalCommentMark

" operators
syn keyword	naturalOperator		and or not eq ne gt lt ge le mask scan

" constants
syn keyword naturalBoolean		true false

syn match	naturalLineNo		"^\d\{4}"

" identifiers
syn match	naturalIdent		"\<[+#a-z][-_#a-z0-9]*\>[^\.']"me=e-1
syn match	naturalIdent		"\<[+#a-z][-_#a-z0-9]*$"
syn match	naturalLegalIdent	"[+#a-z][-_#a-z0-9]*/[-_#a-z0-9]*"

" parentheses
syn region  naturalPar			matchgroup=naturalParGui start="(" end=")" contains=naturalLabel,naturalRef,naturalOperator,@naturalConstant,naturalType,naturalSysVar,naturalPar,naturalLineNo,naturalPComment
syn match	naturalLineRef		"(\d\{4})"

" build syntax groups
syntax cluster naturalConstant	contains=naturalString,naturalNumber,naturalAttribute,naturalBoolean

if v:version >= 508 || !exists("did_natural_syntax_inits")
	if v:version < 508
		let did_natural_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	" The default methods for highlighting.  Can be overridden later

	" Constants
	HiLink naturalFormat		Constant
	HiLink naturalAttribute		Constant
	HiLink naturalNumber		Number
	HiLink naturalString		String
	HiLink naturalBoolean		Boolean

	" All kinds of keywords
	HiLink naturalConditional	Conditional
	HiLink naturalRepeat		Repeat
	HiLink naturalLoop			Repeat
	HiLink naturalFlow			Keyword
	HiLink naturalError			Keyword
	HiLink naturalKeyword		Keyword
	HiLink naturalOperator		Operator
	HiLink naturalParGui		Operator

	" Labels
	HiLink naturalLabel			Label
	HiLink naturalRefLabel		Label

	" Comments
	HiLink naturalPComment		Comment
	HiLink naturalComment		Comment
	HiLink naturalTodo			Todo
	HiLink naturalCommentMark	PreProc

	HiLink naturalInclude		Include
	HiLink naturalSysVar		Identifier
	HiLink naturalLineNo		LineNr
	HiLink naturalLineRef		Error
	HiLink naturalSpecial		Special
	HiLink naturalComKey		Todo

	" illegal things
	HiLink naturalRMKeyword		Error
	HiLink naturalLegalIdent	Error

	HiLink naturalType			Type
	HiLink naturalFunction		Function
	HiLink naturalObjName		Function

	delcommand HiLink
endif

let b:current_syntax = "natural"

" vim:set ts=4 sw=4 noet ft=vim list:
