" Vim syntax file
" This is a GENERATED FILE. Please always refer to source file at the URI below.
" Language: lilo configuration (lilo.conf)
" Maintainer: David Ne\v{c}as (Yeti) <yeti@physics.muni.cz>
" Last Change: 2001-07-10
" URI: http://physics.muni.cz/~yeti/download/lilo.vim


" Setup
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

if version >= 600
  command -nargs=1 SetIsk setlocal iskeyword=<args>
else
  command -nargs=1 SetIsk set iskeyword=<args>
endif
SetIsk @,48-57,.,-,_
delcommand SetIsk

syn case ignore

" Base constructs
syn match liloError "\S\+"
syn match liloComment "#.*$"
syn match liloEnviron "\$\w\+" contained
syn match liloEnviron "\${[^}]\+}" contained
syn match liloDecNumber "-\=\d\+" contained
syn match liloHexNumber "0[xX]\x\+" contained
syn match liloSpecial contained "\\\(\"\|\\\|$\)"
syn region liloString start=+"+ skip=+\\\\\|\\"+ end=+"+ contained contains=liloSpecial,liloEnviron
syn match liloLabel "\S\+" contained contains=liloSpecial,liloEnviron
syn region liloPath start=+[$/]+ skip=+\\\\\|\\ \|\\$"+ end=+ \|$+ contained contains=liloSpecial,liloEnviron
syn region liloAnything start=+[^[:space:]#]+ skip=+\\\\\|\\ \|\\$+ end=+ \|$+ contained contains=liloSpecial,liloEnviron,liloString

" Path
syn keyword liloOption backup boot force-backup install keytable map message nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn keyword liloKernelOpt initrd root nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn keyword liloImageOpt path loader table nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn keyword liloDiskOpt partition nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty

" Other
syn keyword liloOption default serial nextgroup=liloEqAnything,liloEqAnythingComment,liloError skipwhite skipempty
syn keyword liloKernelOpt ramdisk nextgroup=liloEqAnything,liloEqAnythingComment,liloError skipwhite skipempty
syn keyword liloImageOpt alias label nextgroup=liloEqLabel,liloEqLabelComment,liloError skipwhite skipempty
syn keyword liloImageOpt password range nextgroup=liloEqAnything,liloEqAnythingComment,liloError skipwhite skipempty
syn keyword liloDiskOpt set type nextgroup=liloEqAnything,liloEqAnythingComment,liloError skipwhite skipempty

" Symbolic
syn keyword liloKernelOpt vga nextgroup=liloEqVga,liloEqVgaComment,liloError skipwhite skipempty

" Number
syn keyword liloOption delay timeout verbose nextgroup=liloEqDecNumber,liloEqDecNumberComment,liloError skipwhite skipempty
syn keyword liloDiskOpt sectors heads cylinders start nextgroup=liloEqDecNumber,liloEqDecNumberComment,liloError skipwhite skipempty

" String
syn keyword liloKernelOpt append nextgroup=liloEqString,liloEqStringComment,liloError skipwhite skipempty
syn keyword liloImageOpt fallback literal nextgroup=liloEqString,liloEqStringComment,liloError skipwhite skipempty

" Hex number
syn keyword liloImageOpt map-drive to nextgroup=liloEqHexNumber,liloEqHexNumberComment,liloError skipwhite skipempty
syn keyword liloDiskOpt bios normal hidden nextgroup=liloEqNumber,liloEqNumberComment,liloError skipwhite skipempty

" Flag
syn keyword liloOption compact fix-table ignore-table lba32 linear nowarn prompt
syn keyword liloKernelOpt read-only read-write
syn keyword liloImageOpt lock optional restricted single-key unsafe
syn keyword liloDiskOpt change activate deactivate inaccessible reset

" Image
syn keyword liloImage image other nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn keyword liloDisk disk nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn keyword liloChRules change-rules

" Vga keywords
syn keyword liloVgaKeyword ask ext extended normal contained

" Comment followed by equal sign and ...
syn match liloEqPathComment "#.*$" contained nextgroup=liloEqPath,liloEqPathComment,liloError skipwhite skipempty
syn match liloEqVgaComment "#.*$" contained nextgroup=liloEqVga,liloEqVgaComment,liloError skipwhite skipempty
syn match liloEqNumberComment "#.*$" contained nextgroup=liloEqNumber,liloEqNumberComment,liloError skipwhite skipempty
syn match liloEqDecNumberComment "#.*$" contained nextgroup=liloEqDecNumber,liloEqDecNumberComment,liloError skipwhite skipempty
syn match liloEqHexNumberComment "#.*$" contained nextgroup=liloEqHexNumber,liloEqHexNumberComment,liloError skipwhite skipempty
syn match liloEqStringComment "#.*$" contained nextgroup=liloEqString,liloEqStringComment,liloError skipwhite skipempty
syn match liloEqLabelComment "#.*$" contained nextgroup=liloEqLabel,liloEqLabelComment,liloError skipwhite skipempty
syn match liloEqAnythingComment "#.*$" contained nextgroup=liloEqAnything,liloEqAnythingComment,liloError skipwhite skipempty

" Equal sign followed by ...
syn match liloEqPath "=" contained nextgroup=liloPath,liloPathComment,liloError skipwhite skipempty
syn match liloEqVga "=" contained nextgroup=liloVgaKeyword,liloHexNumber,liloDecNumber,liloVgaComment,liloError skipwhite skipempty
syn match liloEqNumber "=" contained nextgroup=liloDecNumber,liloHexNumber,liloNumberComment,liloError skipwhite skipempty
syn match liloEqDecNumber "=" contained nextgroup=liloDecNumber,liloDecNumberComment,liloError skipwhite skipempty
syn match liloEqHexNumber "=" contained nextgroup=liloHexNumber,liloHexNumberComment,liloError skipwhite skipempty
syn match liloEqString "=" contained nextgroup=liloString,liloStringComment,liloError skipwhite skipempty
syn match liloEqLabel "=" contained nextgroup=liloLabel,liloLabelComment,liloError skipwhite skipempty
syn match liloEqAnything "=" contained nextgroup=liloAnything,liloAnythingComment,liloError skipwhite skipempty

" Comment followed by ...
syn match liloPathComment "#.*$" contained nextgroup=liloPath,liloPathComment,liloError skipwhite skipempty
syn match liloVgaComment "#.*$" contained nextgroup=liloVgaKeyword,liloHexNumber,liloVgaComment,liloError skipwhite skipempty
syn match liloNumberComment "#.*$" contained nextgroup=liloDecNumber,liloHexNumber,liloNumberComment,liloError skipwhite skipempty
syn match liloDecNumberComment "#.*$" contained nextgroup=liloDecNumber,liloDecNumberComment,liloError skipwhite skipempty
syn match liloHexNumberComment "#.*$" contained nextgroup=liloHexNumber,liloHexNumberComment,liloError skipwhite skipempty
syn match liloStringComment "#.*$" contained nextgroup=liloString,liloStringComment,liloError skipwhite skipempty
syn match liloLabelComment "#.*$" contained nextgroup=liloLabel,liloLabelComment,liloError skipwhite skipempty
syn match liloAnythingComment "#.*$" contained nextgroup=liloAnything,liloAnythingComment,liloError skipwhite skipempty

" Define the default highlighting
if version >= 508 || !exists("did_lilo_syntax_inits")
  if version < 508
    let did_lilo_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink liloEqPath             liloEquals
  HiLink liloEqWord             liloEquals
  HiLink liloEqVga              liloEquals
  HiLink liloEqDecNumber        liloEquals
  HiLink liloEqHexNumber        liloEquals
  HiLink liloEqNumber           liloEquals
  HiLink liloEqString           liloEquals
  HiLink liloEqLabel            liloEquals
  HiLink liloEqAnything         liloEquals
  HiLink liloEquals             Special

  HiLink liloError              Error

  HiLink liloEqPathComment      liloComment
  HiLink liloEqVgaComment       liloComment
  HiLink liloEqDecNumberComment liloComment
  HiLink liloEqHexNumberComment liloComment
  HiLink liloEqStringComment    liloComment
  HiLink liloEqLabelComment     liloComment
  HiLink liloEqAnythingComment  liloComment
  HiLink liloPathComment        liloComment
  HiLink liloVgaComment         liloComment
  HiLink liloDecNumberComment   liloComment
  HiLink liloHexNumberComment   liloComment
  HiLink liloNumberComment      liloComment
  HiLink liloStringComment      liloComment
  HiLink liloLabelComment       liloComment
  HiLink liloAnythingComment    liloComment
  HiLink liloComment            Comment

  HiLink liloDiskOpt            liloOption
  HiLink liloKernelOpt          liloOption
  HiLink liloImageOpt           liloOption
  HiLink liloOption             Keyword

  HiLink liloDecNumber          liloNumber
  HiLink liloHexNumber          liloNumber
  HiLink liloNumber             Number
  HiLink liloString             String
  HiLink liloPath               Constant

  HiLink liloSpecial            Special
  HiLink liloLabel              Title
  HiLink liloAnything           Normal
  HiLink liloEnviron            Identifier
  HiLink liloVgaKeyword         Identifier
  HiLink liloImage              Type
  HiLink liloChRules            Preproc
  HiLink liloDisk               Preproc

  delcommand HiLink
endif

let b:current_syntax = "lilo"
