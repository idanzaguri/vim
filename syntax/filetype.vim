" my filetype file

augroup filetypedetect
  au! BufRead,BufNewFile *.everilog	setfiletype verilog
  au! BufRead,BufNewFile *.tsk		setfiletype verilog
  au! BufRead,BufNewFile *.mon		setfiletype verilog
  au! BufRead,BufNewFile *.sv		setfiletype verilog
  au! BufRead,BufNewFile *.SV		setfiletype verilog
  au! BufRead,BufNewFile *.V		setfiletype verilog
  au! BufRead,BufNewFile *.v		setfiletype verilog
  au! BufRead,BufNewFile *.vr    setfiletype vera
  au! BufRead,BufNewFile *.vri    setfiletype vera
  au! BufRead,BufNewFile *.rmf    setfiletype c
  au! BufRead,BufNewFile *.uvp    setfiletype c
  au! BufRead,BufNewFile *.list.fil    setfiletype perl
augroup END

