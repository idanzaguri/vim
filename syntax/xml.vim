" Vim syntax file
" Language:	XML
" Maintainer:	Johannes Zellner <johannes@zellner.org>
"		Author and previous maintainer:
"		Paul Siegmann <pauls@euronet.nl>
" Last Change:	Don, 13 Sep 2001 01:33:20 +0200
" Filenames:	*.xml
" URL:		http://www.zellner.org/vim/syntax/xml.vim
" $Id: xml.vim,v 1.36 2001/09/12 23:37:25 joze Exp $

" CREDITS:
"   The original version was derived by Paul Siegmann from
"   Claudio Fleiner's html.vim.
"
" REFERENCES:
"   [1] http://www.w3.org/TR/2000/REC-xml-20001006
"   [2] http://www.w3.org/XML/1998/06/xmlspec-report-19980910.htm
"
"   as <hirauchi@kiwi.ne.jp> pointed out according to reference [1]
"
"   2.3 Common Syntactic Constructs
"   [4]    NameChar    ::=    Letter | Digit | '.' | '-' | '_' | ':' | CombiningChar | Extender
"   [5]    Name        ::=    (Letter | '_' | ':') (NameChar)*
"
" NOTE:
"   1) empty tag delimiters "/>" inside attribute values (strings)
"      confuse syntax highlighting.
"   2) for large files, folding can be pretty slow, especially when
"      loading a file the first time and viewoptions contains 'folds'
"      so that folds of previous sessions are applied.
"      Don't use 'foldmethod=syntax' in this case.


" Quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

let s:xml_cpo_save = &cpo
set cpo&vim

syn case match

" mark illegal characters
syn match xmlError "[<&]"

" strings (inside tags) aka VALUES
"
" EXAMPLE:
"
" <tag foo.attribute = "value">
"                      ^^^^^^^
syn region  xmlString contained start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=xmlEntity display
syn region  xmlString contained start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=xmlEntity display


" punctuation (within attributes) e.g. <tag xml:foo.attribute ...>
"                                              ^   ^
" syn match   xmlAttribPunct +[-:._]+ contained display
syn match   xmlAttribPunct +[:.]+ contained display

" no highlighting for xmlEqual (xmlEqual has no highlighting group)
syn match   xmlEqual +=+ display


" attribute, everything before the '='
"
" PROVIDES: @xmlAttribHook
"
" EXAMPLE:
"
" <tag foo.attribute = "value">
"      ^^^^^^^^^^^^^
"
syn match   xmlAttrib
    \ +[-'"<]\@<!\<[a-zA-Z:_][-.0-9a-zA-Z0-9:_]*\>\(['">]\@!\|$\)+
    \ contained
    \ contains=xmlAttribPunct,@xmlAttribHook
    \ display


" start tag
" use matchgroup=xmlTag to skip over the leading '<'
"
" PROVIDES: @xmlTagHook
"
" EXAMPLE:
"
" <tag id="whoops">
" s^^^^^^^^^^^^^^^e
"
syn region   xmlTag
    \ matchgroup=xmlTag start=+<[^ /!?<>"']\@=+
    \ matchgroup=xmlTag end=+>+
    \ contained
    \ contains=xmlError,xmlAttrib,xmlEqual,xmlString,@xmlTagHook


" highlight the end tag
"
" PROVIDES: @xmlTagHook
" (should we provide a separate @xmlEndTagHook ?)
"
" EXAMPLE:
"
" </tag>
" ^^^^^^
"
syn match   xmlEndTag
    \ +</[^ /!?<>"']\+>+
    \ contained
    \ contains=@xmlTagHook


" tag elements with syntax-folding.
" NOTE: NO HIGHLIGHING -- highlighing is done by contained elements
"
" PROVIDES: @xmlRegionHook
"
" EXAMPLE:
"
" <tag id="whoops">
"   <!-- comment -->
"   <another.tag></another.tag>
"   <empty.tag/>
"   some data
" </tag>
" 
syn region   xmlRegion
    \ start=+<\z([^ /!?<>"']\+\)+
    \ skip=+<!--\_.\{-}-->+
    \ end=+</\z1\_\s\{-}>+
    \ matchgroup=xmlEndTag end=+/>+
    \ fold
    \ contains=xmlTag,xmlEndTag,xmlCdata,xmlRegion,xmlComment,xmlEntity,xmlProcessing,@xmlRegionHook
    \ keepend
    \ extend


" &entities; compare with dtd
syn match   xmlEntity                 "&[^; \t]*;" contains=xmlEntityPunct
syn match   xmlEntityPunct  contained "[&.;]"


" The real comments (this implements the comments as defined by xml,
" but not all xml pages actually conform to it. Errors are flagged.
syn region  xmlComment                start=+<!+        end=+>+ contains=xmlCommentPart,xmlString,xmlCommentError,xmlTodo,@xmlCommentHook extend
syn keyword xmlTodo         contained TODO FIXME XXX display
syn match   xmlCommentError contained "[^><!]"
syn region  xmlCommentPart  contained start=+--+        end=+--+


" CData sections
"
" PROVIDES: @xmlCdataHook
"
syn region    xmlCdata
    \ start=+<!\[CDATA\[+
    \ end=+]]>+
    \ contains=xmlCdataStart,xmlCdataEnd,@xmlCdataHook
    \ keepend
    \ extend

" using the following line instead leads to corrupt folding at CDATA regions
" syn match    xmlCdata      +<!\[CDATA\[\_.\{-}]]>+  contains=xmlCdataStart,xmlCdataEnd,@xmlCdataHook
syn match    xmlCdataStart +<!\[CDATA\[+  contained contains=xmlCdataCdata
syn keyword  xmlCdataCdata CDATA          contained
syn match    xmlCdataEnd   +]]>+          contained


" Processing instructions
" This allows "?>" inside strings -- good idea?
syn region  xmlProcessing matchgroup=xmlProcessingDelim start="<?" end="?>" contains=xmlAttrib,xmlEqual,xmlString


" DTD -- we use dtd.vim here
syn region  xmlDocType matchgroup=xmlDocTypeDecl
    \ start="<!DOCTYPE"he=s+2,rs=s+2 end=">"
    \ fold
    \ contains=xmlDocTypeKeyword,xmlInlineDTD,xmlString
syn keyword xmlDocTypeKeyword contained DOCTYPE PUBLIC SYSTEM
syn region  xmlInlineDTD contained matchgroup=xmlDocTypeDecl start="\[" end="]" contains=@xmlDTD
syn include @xmlDTD <sfile>:p:h/dtd.vim
unlet b:current_syntax


" synchronizing
" TODO !!! to be improved !!!

syn sync match xmlSyncDT grouphere  xmlDocType +\_.\(<!DOCTYPE\)\@=+
" syn sync match xmlSyncDT groupthere  NONE       +]>+

syn sync match xmlSync grouphere   xmlRegion  +\_.\(<[^ /!?<>"']\+\)\@=+
" syn sync match xmlSync grouphere  xmlRegion "<[^ /!?<>"']*>"
syn sync match xmlSync groupthere  xmlRegion  +</[^ /!?<>"']\+>+

syn sync minlines=100


" The default highlighting.
hi def link xmlTodo		Todo
hi def link xmlTag		Function
hi def link xmlEndTag		Identifier
hi def link xmlEntity		Statement
hi def link xmlEntityPunct	Type

hi def link xmlAttribPunct	Comment
hi def link xmlAttrib		Type

hi def link xmlString		String
hi def link xmlComment		Comment
hi def link xmlCommentPart	Comment
hi def link xmlCommentError	Error
hi def link xmlError		Error

hi def link xmlProcessingDelim	Comment
hi def link xmlProcessing	Type

hi def link xmlCdata		String
hi def link xmlCdataCdata	Statement
hi def link xmlCdataStart	Type
hi def link xmlCdataEnd		Type

hi def link xmlDocTypeDecl	Function
hi def link xmlDocTypeKeyword	Statement
hi def link xmlInlineDTD	Function

let b:current_syntax = "xml"

let &cpo = s:xml_cpo_save
unlet s:xml_cpo_save

" vim: ts=8
