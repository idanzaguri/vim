fun! ExpandIt()
	"let pat = '^\([^][]\+\)\[\(\d\+\):\(\d\+\)\].*'
	let pat = '^\([^][]\+\)\[\(\d\+\):\(\d\+\)\]\(.*\)'
    let line = getline('.')
    let lnr = line('.')
    if line !~ pat
        return
    endif

	let s_bit = str2nr(substitute(line, pat,'\2','g')) " start bit
	let e_bit = str2nr(substitute(line, pat,'\3','g')) " end bit

	if s_bit < e_bit
		let exestr = substitute(line, pat,'range(\2,\3, 1)','g')		
	else
		let exestr = substitute(line, pat,'range(\2,\3, -1)','g')
	endif
    exec 'let range='.exestr
    let result = []
    for i in range
		let line = substitute(line, pat,'\1[@@]\4','g')
		call add(result, substitute(line, '@@', i, 'g') )
		
		"call add(result, substitute(line, pat,'\1['.i.'] \4','g') )
    endfor
	call append(lnr, result)
	exec lnr.'d'   
endf
nnoremap <F6> :call ExpandIt()<cr>



function! FindProjectFile()
	let file_name = expand('<cfile>') 
	if !strlen(file_name) 
		echo 'NO FILE UNDER CURSOR' 
		return 
	endif 
	let path = '/prj/qct/chips/talyn_ma/sandiego/common/model/fc_latest/src/units/'
	let cmd = "find ".path." -name ".file_name
	let findresults=system(cmd)
	let findresults_num=strlen(substitute(findresults, "[^\n]", "", "g"))
	if findresults_num < 1
		echo "'".file_name."' not found"
		return
	endif
	exe "sp " .findresults
endfunction
"command! -nargs=* FindProjectFile :call Find(<f-args>)




function! Find()
	let file_name = expand('<cfile>') 
	if !strlen(file_name) 
		echo 'NO FILE UNDER CURSOR' 
		return 
	endif 
	let path = '/prj/qct/chips/talyn_ma/sandiego/common/model/fc_latest/src/units/'
	let cmd = "find ".path." -name ".file_name
	let findresults=system(cmd)
	let findresults_num=strlen(substitute(findresults, "[^\n]", "", "g"))
	if findresults_num < 1
		echo "'".file_name."' not found"
		return
	endif
	exe "sp " .findresults
endfunction
command! -nargs=* Find :call Find(<f-args>)

function! GotoFileWithLineNum() 
	" filename under the cursor 
	let file_name = expand('<cfile>') 
	if !strlen(file_name) 
		echo 'NO FILE UNDER CURSOR' 
		return 
	endif 
	" look for a line number separated by a : 
	if search('\%#\f*:\zs[0-9]\+') 
		" change the 'iskeyword' option temporarily to pick up just numbers 
		let temp = &iskeyword 
		set iskeyword=48-57 
		let line_number = expand('<cword>') 
		exe 'set iskeyword=' . temp 
	endif 
	" edit the file 
	exe 'e '.file_name 
	" if there is a line number, go to it 
	if exists('line_number') 
		exe line_number 
	endif 
endfunction 






if v:version < 700 || exists('loaded_setcolors') || &cp
	finish
endif

let loaded_setcolors = 1
let s:mycolors = ['aiseered', 'anokha', 'anotherdark', 'aqua', 'astroboy', 'astronaut', 'asu1dark', 'autumn', 'autumn2', 'autumnleaf', 'baycomb', 'bclear', 'bigbang', 'biogoo', 'blackbeauty', 'blacksea', 'bluegreen', 'borland', 'breeze', 'brookstream', 'buttercream', 'calmar256-dark', 'calmar256-light', 'calmbreeze', 'camo', 'candy', 'candycode', 'chela_light', 'chocolateliquor', 'clarity', 'cleanphp', 'colorer', 'dante', 'darkZ', 'darkblue2', 'darkbone', 'darkburn', 'darkslategray', 'darkspectrum', 'dawn', 'deepblue', 'dejavu', 'denim', 'desert', 'desert256', 'desertEx', 'dusk', 'dw_blue', 'dw_cyan', 'dw_green', 'dw_orange', 'dw_purple', 'dw_red', 'dw_yellow', 'earendel', 'eclipse', 'ekvoli', 'fine_blue', 'fine_blue2', 'fnaqevan', 'fog', 'freya', 'fruit', 'fruity', 'fu', 'gaea', 'gentooish', 'github', 'golden', 'greyhouse', 'guardian', 'habilight', 'herald', 'impact', 'imperial', 'inkpot', 'intellij', 'ironman', 'jammy', 'jellybeans', 'kellys', 'leo', 'lettuce', 'liquidcarbon', 'lucius', 'luinnar', 'manuscript', 'manxome', 'marklar', 'maroloccio', 'martin_krischik', 'masmed', 'matrix', 'mayansmoke', 'metacosm', 'mickeysoft', 'midnight', 'midnight2', 'mizore', 'molokai', 'montz', 'moria', 'moss', 'motus', 'navajo-night', 'navajo', 'neon', 'neverness', 'newspaper', 'night', 'night_vision', 'nightshimmer', 'no_quarter', 'northland', 'nuvola', 'oceanblack', 'oceandeep', 'oceanlight', 'olive', 'omen', 'papayawhip', 'paradox', 'peaksea', 'print_bw', 'psclone', 'pyte', 'railscasts', 'railscasts2', 'rdark', 'relaxedgreen', 'robinhood', 'rootwater', 'satori', 'scame', 'sea', 'settlemyer', 'sienna', 'silent', 'simpleandfriendly', 'softblue', 'solarized', 'sorcerer', 'soso', 'spring', 'sublimemonokai', 'summerfruit256', 'synic', 'tabula', 'tango', 'tango2', 'taqua', 'tcsoft', 'tesla', 'tir_black', 'tolerable', 'torte', 'twilight', 'two2tango', 'vc', 'vibrantink', 'vimhut', 'vividchalk', 'vylight', 'winter', 'wombat', 'wombat256', 'wombat256mod', 'wood', 'wuye', 'xemacs', 'xoria256', 'zenburn', 'zendnb', 'zenesque', 'zmrok']


function! SortUnique( list, ... )
  let dictionary = {}
  for i in a:list
    execute "let dictionary[ '" . i . "' ] = ''"
  endfor
  let result = []
  if ( exists( 'a:1' ) )
    let result = sort( keys( dictionary ), a:1 )
  else
    let result = sort( keys( dictionary ) )
  endif
  return result
endfunction


" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
	if len(a:args) == 0
		echo 'Current color scheme names:'
		let i = 0
		while i < len(s:mycolors)
			echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
			let i += 5
		endwhile
	elseif a:args == 'all'
		let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
		let s:mycolors = SortUnique(map(paths, 'fnamemodify(v:val, ":t:r")'))
		echo 'List of colors set from all installed color schemes'
	elseif a:args == 'my'
		let c1 = 'default elflord peachpuff desert256 breeze morning'
		let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
		let c3 = 'darkblack freya motus impact less chocolateliquor'
		let s:mycolors = split(c1.' '.c2.' '.c3)
		echo 'List of colors set from built-in names'
	elseif a:args == 'now'
		call s:HourColor()
	else
		let s:mycolors = split(a:args)
		echo 'List of colors set from argument (space-separated names)'
	endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
	call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
	if len(s:mycolors) == 0
		call s:SetColors('all')
	endif
	if exists('g:colors_name')
		let current = index(s:mycolors, g:colors_name)
	else
		let current = -1
	endif
	let missing = []
	let how = a:how
	for i in range(len(s:mycolors))
		if how == 0
			let current = localtime() % len(s:mycolors)
			let how = 1  " in case random color does not exist
		else
			let current += how
			if !(0 <= current && current < len(s:mycolors))
				let current = (how>0 ? 0 : len(s:mycolors)-1)
			endif
		endif
		try
			execute 'colorscheme '.s:mycolors[current]
			break
		catch /E185:/
			call add(missing, s:mycolors[current])
		endtry
	endfor
	redraw
	if len(missing) > 0
		echo 'Error: colorscheme not found:' join(missing)
	endif
	if (a:echo_color)
		echo g:colors_name
	endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
	let hr = str2nr(strftime('%H'))
	if hr <= 3
		let i = 0
	elseif hr <= 7
		let i = 1
	elseif hr <= 14
		let i = 2
	elseif hr <= 18
		let i = 3
	else
		let i = 4
	endif
	let nowcolors = 'elflord morning desert evening pablo'
	execute 'colorscheme '.split(nowcolors)[i]
	redraw
	echo g:colors_name
endfunction
