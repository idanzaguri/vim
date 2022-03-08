"colorscheme molokai 
colorscheme darkblue2
set ch=2 "Make command line two lines high
syntax on " Switch on syntax highlighting.

hi Search guibg=cyan guifg=black

set mousehide " Hide the mouse pointer while typing
set gcr=a:blinkon0 " diable cursor blinking	

" tabs settings
set guitablabel=%t\ %M " display only file name rather than the full path in tab title (M- add plus sign if modified)
set tabpagemax=100

"remove gui toolbar
set guioptions-=T


"map <press Ctrl-1> : wa<ENTER>
"map <F12> : wa<ENTER>

"search files in commom project dir
map <F2> :call FindProjectFile() <cr>
"search word in commom and user project dirs and open alist of results that can be double-clicked
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j /prj/qct/chips/talyn_ma/sandiego/common/model/fc_latest/src/units/**/*.e /prj/qct/chips/talyn_ma/sandiego/users/izaguri/src/units/**/.e" <cr> :sp <cr> :copen <cr>
map <F5> :sp <cr>:call GotoFileWithLineNum() <cr>


" Move tabs with alt + left|right
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>


"command -nargs=0 CO :!cleartool co -nc % <CR>
"command -nargs=0 CI :!dssc ci -noc % ;
"command -nargs=* RUN :w | :!./% <args>
nmap CO :!cleartool co -nc %:p <CR>
