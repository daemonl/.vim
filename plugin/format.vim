
augroup formatters
	au!
	au BufRead,BufNewFile *.json let b:fmtprg="python -mjson.tool"
augroup END


func! Format()
	execute "%!" b:fmtprg
endfunction

func! FilterThroughStringCmd(cmd)
	echo cmd
endfunction

command! Format call Format()
command! SpacesToTabs call SpacesToTabs()
