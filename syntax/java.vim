" Vim syntax file
" Language:     Java
" Maintainer:   Claudio Fleiner <claudio@fleiner.com>
" URL:          http://www.fleiner.com/vim/syntax/java.vim
" Last Change:  2001 Sept 11

" Please check :help java.vim for comments on some of the options available.

" Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='java'
endif

" don't use standard HiLink, it will not work with included syntax files
if version < 508
  command! -nargs=+ JavaHiLink hi link <args>
else
  command! -nargs=+ JavaHiLink hi def link <args>
endif

" some characters that cannot be in a java program (outside a string)
syn match javaError "[\\@`]"
syn match javaError "<<<\|\.\.\|=>\|<>\|||=\|&&=\|[^-]->\|\*\/"

" use separate name so that it can be deleted in javacc.vim
syn match javaError2 "#\|=<"
JavaHiLink javaError2 javaError



" keyword definitions
syn keyword javaExternal        import native package
syn keyword javaError           goto const
syn keyword javaConditional     if else switch
syn keyword javaRepeat          while for do
syn keyword javaBoolean         true false
syn keyword javaConstant        null
syn keyword javaTypedef         this super
syn keyword javaOperator        new instanceof
syn keyword javaType            boolean char byte short int long float double
syn keyword javaType            void
syn keyword javaStatement       return
syn keyword javaStorageClass    static synchronized transient volatile final strictfp serializable
syn keyword javaExceptions      throw try catch finally
syn keyword javaAssert          assert
syn keyword javaMethodDecl      synchronized throws
syn keyword javaClassDecl       extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syn match   javaTypedef         "\.\s*\<class\>"ms=s+1
syn match   javaClassDecl       "^class\>"
syn match   javaClassDecl       "[^.]\s*\<class\>"ms=s+1
syn keyword javaBranch          break continue nextgroup=javaUserLabelRef skipwhite
syn match   javaUserLabelRef    "\k\+" contained
syn keyword javaScopeDecl       public protected private abstract

if exists("java_highlight_java_lang_ids") || exists("java_highlight_java_lang") || exists("java_highlight_all")
  " java.lang.*
  syn match javaLangClass "\<System\>"
  syn keyword javaLangClass  Cloneable Comparable Runnable Boolean Byte Class
  syn keyword javaLangClass  Character CharSequence ClassLoader Compiler Double Float
  syn keyword javaLangClass  Integer InheritableThreadLocal Long Math Number Object Package Process
  syn keyword javaLangClass  Runtime RuntimePermission InheritableThreadLocal
  syn keyword javaLangClass  SecurityManager Short String StrictMath StackTraceElement
  syn keyword javaLangClass  StringBuffer Thread ThreadGroup
  syn keyword javaLangClass  ThreadLocal Throwable Void ArithmeticException
  syn keyword javaLangClass  ArrayIndexOutOfBoundsException AssertionError
  syn keyword javaLangClass  ArrayStoreException ClassCastException
  syn keyword javaLangClass  ClassNotFoundException
  syn keyword javaLangClass  CloneNotSupportedException Exception
  syn keyword javaLangClass  IllegalAccessException
  syn keyword javaLangClass  IllegalArgumentException
  syn keyword javaLangClass  IllegalMonitorStateException
  syn keyword javaLangClass  IllegalStateException
  syn keyword javaLangClass  IllegalThreadStateException
  syn keyword javaLangClass  IndexOutOfBoundsException
  syn keyword javaLangClass  InstantiationException InterruptedException
  syn keyword javaLangClass  NegativeArraySizeException NoSuchFieldException
  syn keyword javaLangClass  NoSuchMethodException NullPointerException
  syn keyword javaLangClass  NumberFormatException RuntimeException
  syn keyword javaLangClass  SecurityException StringIndexOutOfBoundsException
  syn keyword javaLangClass  UnsupportedOperationException
  syn keyword javaLangClass  AbstractMethodError ClassCircularityError
  syn keyword javaLangClass  ClassFormatError Error ExceptionInInitializerError
  syn keyword javaLangClass  IllegalAccessError InstantiationError
  syn keyword javaLangClass  IncompatibleClassChangeError InternalError
  syn keyword javaLangClass  LinkageError NoClassDefFoundError
  syn keyword javaLangClass  NoSuchFieldError NoSuchMethodError
  syn keyword javaLangClass  OutOfMemoryError StackOverflowError
  syn keyword javaLangClass  ThreadDeath UnknownError UnsatisfiedLinkError
  syn keyword javaLangClass  UnsupportedClassVersionError VerifyError
  syn keyword javaLangClass  VirtualMachineError
  syn keyword javaLangObject clone equals finalize getClass hashCode
  syn keyword javaLangObject notify notifyAll toString wait
  JavaHiLink javaLangClass                   javaConstant
  JavaHiLink javaLangObject                  javaConstant
  syn cluster javaTop add=javaLangObject,javaLangClass
  syn cluster javaClasses add=javaLangClass
endif

if filereadable(expand("<sfile>:p:h")."/javaid.vim")
  source <sfile>:p:h/javaid.vim
endif

if exists("java_space_errors")
  if !exists("java_no_trail_space_error")
    syn match   javaSpaceError  "\s\+$"
  endif
  if !exists("java_no_tab_space_error")
    syn match   javaSpaceError  " \+\t"me=e-1
  endif
endif

syn region  javaLabelRegion     transparent matchgroup=javaLabel start="\<case\>" matchgroup=NONE end=":" contains=javaNumber,javaCharacter
syn match   javaUserLabel       "^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=javaLabel
syn keyword javaLabel           default

if !exists("java_allow_cpp_keywords")
  syn keyword javaError auto delete enum extern friend inline redeclared
  syn keyword javaError register signed sizeof struct template typedef union
  syn keyword javaError unsigned operator
endif

" The following cluster contains all java groups except the contained ones
syn cluster javaTop add=javaExternal,javaError,javaError,javaBranch,javaLabelRegion,javaLabel,javaConditional,javaRepeat,javaBoolean,javaConstant,javaTypedef,javaOperator,javaType,javaType,javaStatement,javaStorageClass,javaAssert,javaExceptions,javaMethodDecl,javaClassDecl,javaClassDecl,javaClassDecl,javaScopeDecl,javaError,javaError2,javaUserLabel,javaLangObject


" Comments
syn keyword javaTodo             contained TODO FIXME XXX
if exists("java_comment_strings")
syn region  javaCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=javaSpecial,javaCommentStar,javaSpecialChar,@Spell
syn region  javaComment2String   contained start=+"+  end=+$\|"+  contains=javaSpecial,javaSpecialChar,@Spell
syn match   javaCommentCharacter contained "'\\[^']\{1,6\}'" contains=javaSpecialChar
syn match   javaCommentCharacter contained "'\\''" contains=javaSpecialChar
syn match   javaCommentCharacter contained "'[^\\]'"
  syn cluster javaCommentSpecial add=javaCommentString,javaCommentCharacter,javaNumber
  syn cluster javaCommentSpecial2 add=javaComment2String,javaCommentCharacter,javaNumber
endif
syn region  javaComment          start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syn match   javaCommentStar      contained "^\s*\*[^/]"me=e-1
syn match   javaCommentStar      contained "^\s*\*$"
syn match   javaLineComment      "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell
JavaHiLink javaCommentString javaString
JavaHiLink javaComment2String javaString
JavaHiLink javaCommentCharacter javaCharacter

syn cluster javaTop add=javaComment,javaLineComment

if !exists("java_ignore_javadoc") && main_syntax != 'jsp'
  syntax case ignore
  " syntax coloring for javadoc comments (HTML)
  syntax include @javaHtml <sfile>:p:h/html.vim
  unlet b:current_syntax
  syn region  javaDocComment    start="/\*\*"  end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaTodo,@Spell
  syn region  javaCommentTitle  contained matchgroup=javaDocComment start="/\*\*"   matchgroup=javaCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="@"me=s-1,he=s-1 end="\*/"me=s-1,he=s-1 contains=@javaHtml,javaCommentStar,javaTodo,@Spell

  syn region javaDocTags  contained start="{@link" end="}"
  syn match  javaDocTags  contained "@\(see\|param\|exception\|throws\)\s\+\S\+" contains=javaDocParam
  syn match  javaDocParam contained "\s\S\+"
  syn match  javaDocTags  contained "@\(version\|author\|return\|deprecated\|since\)\>"
  syntax case match
endif

" match the special comment /**/
syn match   javaComment          "/\*\*/"

" Strings and constants
syn match   javaSpecialError     contained "\\."
syn match   javaSpecialCharError contained "[^']"
syn match   javaSpecialChar      contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  javaString          start=+"+ end=+"+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
" next line disabled, it can cause a crash for a long line
"syn match   javaStringError      +"\([^"\\]\|\\.\)*$+
syn match   javaCharacter        "'[^']*'" contains=javaSpecialChar,javaSpecialCharError
syn match   javaCharacter        "'\\''" contains=javaSpecialChar
syn match   javaCharacter        "'[^\\]'"
syn match   javaNumber           "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
syn match   javaNumber           "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
syn match   javaNumber           "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
syn match   javaNumber           "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"

" unicode characters
syn match   javaSpecial "\\u\d\{4\}"

syn cluster javaTop add=javaString,javaCharacter,javaNumber,javaSpecial,javaStringError

if exists("java_highlight_functions")
  if java_highlight_functions == "indent"
    syn match  javaFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses
    syn region javaFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses
    syn match  javaFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)" contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses
    syn region javaFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*,\s*+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses
  else
    " This line catches method declarations at any indentation>0, but it assumes
    " two things:
    "   1. class names are always capitalized (ie: Button)
    "   2. method names are never capitalized (except constructors, of course)
    syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*(+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses
  endif
  syn match  javaBraces  "[{}]"
  syn cluster javaTop add=javaFuncDef,javaBraces
endif

if exists("java_highlight_debug")

  " Strings and constants
  syn match   javaDebugSpecial          contained "\\\d\d\d\|\\."
  syn region  javaDebugString           contained start=+"+  end=+"+  contains=javaDebugSpecial
  syn match   javaDebugStringError      +"\([^"\\]\|\\.\)*$+
  syn match   javaDebugCharacter        contained "'[^\\]'"
  syn match   javaDebugSpecialCharacter contained "'\\.'"
  syn match   javaDebugSpecialCharacter contained "'\\''"
  syn match   javaDebugNumber           contained "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
  syn match   javaDebugNumber           contained "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
  syn match   javaDebugNumber           contained "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
  syn match   javaDebugNumber           contained "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
  syn keyword javaDebugBoolean          contained true false
  syn keyword javaDebugType             contained null this super
  syn region javaDebugParen  start=+(+ end=+)+ contained contains=javaDebug.*,javaDebugParen

  " to make this work you must define the highlighting for these groups
  syn match javaDebug "System\.\(out\|err\)\.print\(ln\)*\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen
  syn match javaDebug "[A-Za-z][a-zA-Z0-9_]*\.printStackTrace\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen
  syn match javaDebug "trace[SL]\=\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen

  syn cluster javaTop add=javaDebug

  if version >= 508 || !exists("did_c_syn_inits")
    JavaHiLink javaDebug                 Debug
    JavaHiLink javaDebugString           DebugString
    JavaHiLink javaDebugStringError      javaError
    JavaHiLink javaDebugType             DebugType
    JavaHiLink javaDebugBoolean          DebugBoolean
    JavaHiLink javaDebugNumber           Debug
    JavaHiLink javaDebugSpecial          DebugSpecial
    JavaHiLink javaDebugSpecialCharacter DebugSpecial
    JavaHiLink javaDebugCharacter        DebugString
    JavaHiLink javaDebugParen            Debug

    JavaHiLink DebugString               String
    JavaHiLink DebugSpecial              Special
    JavaHiLink DebugBoolean              Boolean
    JavaHiLink DebugType                 Type
  endif
endif

if exists("java_mark_braces_in_parens_as_errors")
  syn match javaInParen          contained "[{}]"
  JavaHiLink javaInParen        javaError
  syn cluster javaTop add=javaInParen
endif

" catch errors caused by wrong parenthesis
syn region  javaParen            transparent start="(" end=")" contains=@javaTop,javaParen
syn match   javaParenError       ")"
JavaHiLink javaParenError       javaError

if !exists("java_minlines")
  let java_minlines = 10
endif
exec "syn sync ccomment javaComment minlines=" . java_minlines

" The default highlighting.
if version >= 508 || !exists("did_java_syn_inits")
  if version < 508
    let did_java_syn_inits = 1
  endif
  JavaHiLink javaFuncDef		Function
  JavaHiLink javaBraces			Function
  JavaHiLink javaBranch			Conditional
  JavaHiLink javaUserLabelRef		javaUserLabel
  JavaHiLink javaLabel			Label
  JavaHiLink javaUserLabel		Label
  JavaHiLink javaConditional		Conditional
  JavaHiLink javaRepeat			Repeat
  JavaHiLink javaExceptions		Exception
  JavaHiLink javaAssert			Statement
  JavaHiLink javaStorageClass		StorageClass
  JavaHiLink javaMethodDecl		javaStorageClass
  JavaHiLink javaClassDecl		javaStorageClass
  JavaHiLink javaScopeDecl		javaStorageClass
  JavaHiLink javaBoolean		Boolean
  JavaHiLink javaSpecial		Special
  JavaHiLink javaSpecialError		Error
  JavaHiLink javaSpecialCharError	Error
  JavaHiLink javaString			String
  JavaHiLink javaCharacter		Character
  JavaHiLink javaSpecialChar		SpecialChar
  JavaHiLink javaNumber			Number
  JavaHiLink javaError			Error
  JavaHiLink javaStringError		Error
  JavaHiLink javaStatement		Statement
  JavaHiLink javaOperator		Operator
  JavaHiLink javaComment		Comment
  JavaHiLink javaDocComment		Comment
  JavaHiLink javaLineComment		Comment
  JavaHiLink javaConstant		Constant
  JavaHiLink javaTypedef		Typedef
  JavaHiLink javaTodo			Todo

  JavaHiLink javaCommentTitle		SpecialComment
  JavaHiLink javaDocTags		Special
  JavaHiLink javaDocParam		Function
  JavaHiLink javaCommentStar		javaComment

  JavaHiLink javaType			Type
  JavaHiLink javaExternal		Include

  JavaHiLink htmlComment		Special
  JavaHiLink htmlCommentPart		Special
  JavaHiLink javaSpaceError		Error
endif

delcommand JavaHiLink

let b:current_syntax = "java"

if main_syntax == 'java'
  unlet main_syntax
endif

let b:spell_options="contained"

" vim: ts=8
