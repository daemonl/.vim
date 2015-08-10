func! SchkitAuto()
	augroup schkit
		au!
		au BufWritePost *.coffee make
		au BufWritePost *.ts make
		au BufWritePost *.less make
		au BufWritePost *.yml make
	augroup END
endfunction

func! NoSchkitAuto()
	augroup schkit
		au!
	augroup END
endfunction

command! SchkitAuto call SchkitAuto()
command! NoSchkitAuto call NoSchkitAuto()
