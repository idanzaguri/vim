" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	1998 Feb 24

" This is the startup file for syntax highlighting.
" 1. Set the default highlight groups.
" 2. Install autocommands for all the available syntax files.
" 3. Install the Syntax menu.

if has("syntax")

  " Make sure the '<' flag is not included in 'cpoptions', otherwise <CR> would
  " not be recognized.  See ":help 'cpoptions'".
  let syntax_cpo_save = &cpo
  let &cpo = ""

  " let others know that syntax has been switched on
  let syntax_on = 1

  hi Comment  	ctermfg=4 guifg=LightBlue
  hi Constant	ctermfg=1 guifg=Cyan
  hi Special	ctermfg=6 guifg=Red
  hi Identifier ctermfg=3 guifg=Yellow
  hi Statement 	ctermfg=5 gui=bold guifg=LightGreen
  hi PreProc	ctermfg=2 guifg=Gold
  hi Type	ctermfg=3 gui=bold guifg=Yellow
  hi Ignore	ctermfg=0 guifg=bg
  
  hi Error	term=reverse ctermbg=6 ctermfg=Red guibg=Red guifg=Red
  hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

  " Common groups that link to default highlighting.
  " You can specify other highlighting easily.
  hi link String	Constant
  hi link Character	Constant
  hi link Number	Constant
  hi link Boolean	Constant
  hi link Float		Number
  hi link Function	Identifier
  hi link Conditional	Statement
  hi link Repeat	Statement
  hi link Label		Special	
  hi link Operator	Statement
  hi link Keyword	Statement
  hi link Exception	Statement
  hi link Include	PreProc
  hi link Define	PreProc
  hi link Macro		PreProc
  hi link PreCondit	PreProc
  hi link StorageClass	Type
  hi link Structure	Type
  hi link Typedef	Type
  hi link Tag		Special
  hi link SpecialChar	Special
  hi link Delimiter	Special
  hi link SpecialComment Special
  hi link Debug		Special


  augroup syntax

  " First remove all old syntax autocommands.
  au!

  " Assembly (all kinds)
  au BufNewFile,BufRead *.asm,*.s,*.i,*.mac	so ~/.vim/nasm.vim

  " C
  au BufNewFile,BufRead *.c			so $VIM/syntax/c.vim

  " C++
  if has("fname_case")
    au BufNewFile,BufRead *.cpp,*.cc,*.cxx,*.c++,*.C,*.h,*.H,*.hh,*.hxx,*.hpp,*.inl so $VIM/syntax/cpp.vim
  else
    au BufNewFile,BufRead *.cpp,*.cc,*.cxx,*.c++,*.h,*.hh,*.hxx,*.hpp,*.inl so $VIM/syntax/cpp.vim
  endif

  " mem 
  au BufNewFile,BufRead *.e,*.E,*.gnuas,*.mem	so $VIM/syntax/eiffel.vim

  " Makefile
  au BufNewFile,BufRead [mM]akefile*,GNUmakefile,*.mk,*.mak,*.make so $VIM/syntax/make.vim

  " Manpage
  au BufNewFile,BufRead *.man			so $VIM/syntax/man.vim

  " Perl
  au BufNewFile,BufRead *.pl,*.prl			so ~/.vim/perl.vim
  
  " Perl or XPM
  au BufNewFile,BufRead *.pm			so $VIM/syntax/pmfile.vim

  " Perl POD
  au BufNewFile,BufRead *.pod			so $VIM/syntax/pod.vim
 
  " Shell scripts (sh, ksh, bash, csh)
  au BufNewFile,BufRead .profile,.bashrc,.kshrc,*.sh,*.ksh,*.bash,*.env,.aliases so $VIM/syntax/sh.vim
  au BufNewFile,BufRead .login,.cshrc,.tcshrc,*.csh,*.tcsh so $VIM/syntax/csh.vim

  " Verilog HDL
  au BufNewFile,BufRead *.v,*.PMV,*.everilog,*.ver,*.sim,*.hv,*.glv,*.sa,*.sa_args,*.sa_stb	so $VIM/syntax/verilog.vim
" system verilog
au BufNewFile,BufRead *.sv,                   so /users/b09576/.vim/syntax/verilog_systemverilog.vim

  " Vim Help file
  if has("mac")
    au BufNewFile,BufRead *[/:]vim*[/:]doc[/:]*.txt	so $VIM/syntax/help.vim
  else
    au BufNewFile,BufRead */vim*/doc/*.txt	so $VIM/syntax/help.vim
  endif

  " Vim script
  au BufNewFile,BufRead *vimrc*,*.vim,.exrc,_exrc so $VIM/syntax/vim.vim
  " Vim script
   " Viminfo file
  au BufNewFile,BufRead .viminfo,_viminfo	so $VIM/syntax/viminfo.vim

  " Vgrindefs file
  au BufNewFile,BufRead vgrindefs		so $VIM/syntax/vgrindefs.vim

  " X resources file
  au BufNewFile,BufRead *.Xdefaults,*/app-defaults/* so $VIM/syntax/xdefaults.vim

  augroup END
  
  " Execute the syntax autocommands for the each buffer.
  doautoall syntax BufRead

  " Restore the previous value of 'cpoptions'.
  let &cpo = syntax_cpo_save
  unlet syntax_cpo_save

endif " has("syntax")

" vim: ts=8
