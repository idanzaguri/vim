" Vim syntax file
" Language:	SGML
" Maintainer:	Johannes Zellner <johannes@zellner.org>
" Last Change:	Sam, 03 M?r 2001 23:13:12 +0100
" Filenames:	*.sgml,*.sgm
" URL:		http://www.zellner.org/vim/syntax/sgml.vim
" $Id: sgml.vim,v 1.1 2001/01/19 11:26:01 joze Exp $

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let s:sgml_cpo_save = &cpo
set cpo&vim

syn case match

" mark illegal characters
syn match sgmlError "[<&]"


" strings (inside tags) aka VALUES
"
" EXAMPLE:
"
" <tag foo.attribute = "value">
"                      ^^^^^^^
syn region  sgmlString contained start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=sgmlEntity display
syn region  sgmlString contained start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=sgmlEntity display

" punctuation (within attributes) e.g. <tag sgml:foo.attribute ...>
"                                              ^   ^
syn match   sgmlAttribPunct +[:.]+ contained display


" no highlighting for sgmlEqual (sgmlEqual has no highlighting group)
syn match   sgmlEqual +=+


" attribute, everything before the '='
"
" PROVIDES: @sgmlAttribHook
"
" EXAMPLE:
"
" <tag foo.attribute = "value">
"      ^^^^^^^^^^^^^
"
syn match   sgmlAttrib
    \ +[^-'"<]\@<=\<[a-zA-Z0-9.:]\+\>\([^'">]\@=\|$\)+
    \ contained
    \ contains=sgmlAttribPunct,@sgmlAttribHook
    \ display


" start tag
" use matchgroup=sgmlTag to skip over the leading '<'
" see also sgmlEmptyTag below.
"
" PROVIDES: @sgmlTagHook
"
syn region   sgmlTag
    \ matchgroup=sgmlTag start=+<[^ /!?"']\@=+
    \ matchgroup=sgmlTag end=+>+
    \ contained
    \ contains=sgmlError,sgmlAttrib,sgmlEqual,sgmlString,@sgmlTagHook


" tag content for empty tags. This is the same as sgmlTag
" above, except the `matchgroup=sgmlEndTag for highlighting
" the end '/>' differently.
"
" PROVIDES: @sgmlTagHook
"
syn region   sgmlEmptyTag
    \ matchgroup=sgmlTag start=+<[^ /!?"']\@=+
    \ matchgroup=sgmlEndTag end=+/>+
    \ contained
    \ contains=sgmlError,sgmlAttrib,sgmlEqual,sgmlString,@sgmlTagHook


" end tag
" highlight everything but not the trailing '>' which
" was already highlighted by the containing sgmlRegion.
"
" PROVIDES: @sgmlTagHook
" (should we provide a separate @sgmlEndTagHook ?)
"
syn match   sgmlEndTag
    \ +</[^ /!?>"']\+>+
    \ contained
    \ contains=@sgmlTagHook


" [-- SGML SPECIFIC --]

" SGML specific
" tag content for abbreviated regions
"
" PROVIDES: @sgmlTagHook
"
syn region   sgmlAbbrTag
    \ matchgroup=sgmlTag start=+<[^ /!?"']\@=+
    \ matchgroup=sgmlTag end=+/+
    \ contained
    \ contains=sgmlError,sgmlAttrib,sgmlEqual,sgmlString,@sgmlTagHook


" SGML specific
" just highlight the trailing '/'
syn match   sgmlAbbrEndTag +/+


" SGML specific
" abbreviated regions
"
" No highlighing, highlighing is done by contained elements.
"
" PROVIDES: @sgmlRegionHook
"
" EXAMPLE:
"
" <bold/Im Anfang war das Wort/
"
syn match   sgmlAbbrRegion
    \ +<[^/!?>"']\+/\_[^/]\+/+
    \ contains=sgmlAbbrTag,sgmlAbbrEndTag,sgmlCdata,sgmlComment,sgmlEntity,@sgmlRegionHook

" [-- END OF SGML SPECIFIC --]


" real (non-empty) elements. We cannot do syntax folding
" as in xml, because end tags may be optional in sgml depending
" on the dtd.
" No highlighing, highlighing is done by contained elements.
"
" PROVIDES: @sgmlRegionHook
"
" EXAMPLE:
"
" <tag id="whoops">
"   <!-- comment -->
"   <another.tag></another.tag>
"   <another.tag/>
"   some data
" </tag>
"
" SGML specific:
" compared to xmlRegion:
"   - removed folding
"   - added a single '/'in the start pattern
"
syn region   sgmlRegion
    \ start=+<\z([^ /!?>"']\+\)\(\(\_[^/>]*[^/!?]>\)\|>\)+
    \ end=+</\z1>+
    \ contains=sgmlTag,sgmlEndTag,sgmlCdata,@sgmlRegionCluster,sgmlComment,sgmlEntity,@sgmlRegionHook
    \ keepend
    \ extend


" empty tags. Just a container, no highlighting.
" Compare this with sgmlTag.
"
" EXAMPLE:
"
" <tag id="lola"/>
"
" TODO use sgmlEmptyTag intead of sgmlTag
syn match    sgmlEmptyRegion
    \ +<[^ /!?>"']\(\_[^"'<>]\|"\_[^"]*"\|'\_[^']*'\)*/>+
    \ contains=sgmlEmptyTag


" cluster which contains the above two elements
syn cluster sgmlRegionCluster contains=sgmlRegion,sgmlEmptyRegion,sgmlAbbrRegion


" &entities; compare with dtd
syn match   sgmlEntity                 "&[^; \t]*;" contains=sgmlEntityPunct
syn match   sgmlEntityPunct  contained "[&.;]"


" The real comments (this implements the comments as defined by sgml,
" but not all sgml pages actually conform to it. Errors are flagged.
syn region  sgmlComment                start=+<!+        end=+>+ contains=sgmlCommentPart,sgmlString,sgmlCommentError,sgmlTodo
syn keyword sgmlTodo         contained TODO FIXME XXX
syn match   sgmlCommentError contained "[^><!]"
syn region  sgmlCommentPart  contained start=+--+        end=+--+


" CData sections
"
" PROVIDES: @sgmlCdataHook
"
syn region    sgmlCdata
    \ start=+<!\[CDATA\[+
    \ end=+]]>+
    \ contains=sgmlCdataStart,sgmlCdataEnd,@sgmlCdataHook
    \ keepend
    \ extend
" using the following line instead leads to corrupt folding at CDATA regions
" syn match    sgmlCdata      +<!\[CDATA\[\_.\{-}]]>+  contains=sgmlCdataStart,sgmlCdataEnd,@sgmlCdataHook
syn match    sgmlCdataStart +<!\[CDATA\[+  contained contains=sgmlCdataCdata
syn keyword  sgmlCdataCdata CDATA          contained
syn match    sgmlCdataEnd   +]]>+          contained


" Processing instructions
" This allows "?>" inside strings -- good idea?
syn region  sgmlProcessing matchgroup=sgmlProcessingDelim start="<?" end="?>" contains=sgmlAttrib,sgmlEqual,sgmlString


" DTD -- we use dtd.vim here
syn region  sgmlDocType matchgroup=sgmlDocTypeDecl start="<!DOCTYPE"he=s+2,rs=s+2 end=">" contains=sgmlDocTypeKeyword,sgmlInlineDTD,sgmlString
syn keyword sgmlDocTypeKeyword contained DOCTYPE PUBLIC SYSTEM
syn region  sgmlInlineDTD contained start="\[" end="]" contains=@sgmlDTD
syn include @sgmlDTD <sfile>:p:h/dtd.vim


" synchronizing
" TODO !!! to be improved !!!

syn sync match sgmlSyncDT grouphere  sgmlDocType +\_.\(<!DOCTYPE\)\@=+
" syn sync match sgmlSyncDT groupthere  NONE       +]>+

syn sync match sgmlSync grouphere   sgmlRegion  +\_.\(<[^ /!?>"']\+\)\@=+
" syn sync match sgmlSync grouphere  sgmlRegion "<[^ /!?>"']*>"
syn sync match sgmlSync groupthere  sgmlRegion  +</[^ /!?>"']\+>+

syn sync minlines=100


" The default highlighting.
hi def link sgmlTodo                      Todo
hi def link sgmlTag                       Function
hi def link sgmlEndTag                    Identifier
" SGML specifig
hi def link sgmlAbbrEndTag                Identifier
hi def link sgmlEmptyTag                  Function
hi def link sgmlEntity                    Statement
hi def link sgmlEntityPunct               Type

hi def link sgmlAttribPunct               Comment
hi def link sgmlAttrib                    Type

hi def link sgmlString                    String
hi def link sgmlComment                   Comment
hi def link sgmlCommentPart               Comment
hi def link sgmlCommentError              Error
hi def link sgmlError                     Error

hi def link sgmlProcessingDelim           Comment
hi def link sgmlProcessing                Type

hi def link sgmlCdata                     String
hi def link sgmlCdataCdata                Statement
hi def link sgmlCdataStart                Type
hi def link sgmlCdataEnd                  Type

hi def link sgmlDocTypeDecl               Function
hi def link sgmlDocTypeKeyword            Statement
hi def link sgmlInlineDTD                 Function

let b:current_syntax = "sgml"

let &cpo = s:sgml_cpo_save
unlet s:sgml_cpo_save

" vim: ts=8
