let $PATH .= expand(":$HOME/go/bin:$HOME/.path")
let $GOPATH = expand(":$HOME/go")

" Vundle!
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'

Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'majutsushi/tagbar'

"Languages
Plugin 'leafgarland/typescript-vim'
Plugin 'ingydotnet/yaml-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'daemonl/schkit-vim'

Plugin 'godlygeek/tabular'
"Plugin 'dbext.vim'
Plugin 'tpope/vim-surround'
Plugin 'javacomplete'
Plugin 'scrooloose/syntastic'

call vundle#end()
let g:gofmt_command = "goimports"
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

let g:airline_powerline_fonts = 1


""""
" Numbers
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'netrw']

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

""""""""""""""""""""""""""
" Typescript
"
set rtp+=/usr/local/lib/node_modules/typescript-tools

set number
set mouse=a
set t_Co=256
colorscheme molokai
set tabstop=4 softtabstop=4 shiftwidth=4

let g:miniBufExplBuffersNeeded = 1
let g:netrw_liststyle = 3


"hi MBENormal               guifg=White guibg=Black
"hi MBEChanged              guifg=Blue guibg=Black
"hi MBEVisibleNormal        guifg=Green guibg=Black
"hi MBEVisibleChanged       guifg=Green guibg=Black
"hi MBEVisibleActiveNormal  guifg=Green guibg=Black
"hi MBEVisibleActiveChanged guifg=Green guibg=Black

" display indentation guides
set list listchars=tab:·\ ,trail:·,extends:»,precedes:«,nbsp:×

" My Maps

"inoremap <C-Space> <C-x><C-o>
"inoremap <C-@> <C-x><C-o>
noremap <PageUp> :bprev!<CR>
noremap <PageDown> :bnext!<CR>
imap <PageUp> <Nop>
imap <PageDown> <Nop>
" Toggle Vexplore with Ctrl-E
nnoremap \ :NERDTreeToggle<CR>
" Copy and Paste
vnoremap <C-c> "+y
noremap <C-c> "+y
noremap <C-v> "+p

" Super Tab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

"colorscheme default
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

set guicursor=n-v-c:block-Cursor
set guicursor=i:ver25-iCursor

"set omnifunc=syntaxcomplete#Complete

" Make enter select the current item
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" Insert Mode Colors
augroup insertMode
	au!
	au InsertEnter * hi StatusLine term=reverse guifg=Orange guibg=Black
	au InsertLeave * hi StatusLine term=reverse guifg=Black guibg=Green
augroup END
hi StatusLine term=reverse guifg=Black guibg=Green

" File Type Load Mappings
augroup fileTypes
	au!
	au BufRead,BufNewFile *.md setlocal filetype=markdown
	au BufRead,BufNewFile *.ts setlocal filetype=typescript
augroup END

" Lazy shift key :-)
command! W w

" ON SAVE...
augroup linters
	au!
	au BufWritePost *.go Fmt
augroup END

func! SchkitAuto()
	augroup schkit
		au!
		au BufWritePost field_map.yml make
		au BufWritePost portal_model.yml make
		au BufWritePost *.coffee make
		au BufWritePost *.ts make
	augroup END
endfunction

func! NoSchkitAuto()
	augroup schkit
		au!
	augroup END
endfunction


command! SchkitAuto call SchkitAuto()
command! NoSchkitAuto call NoSchkitAuto()

map <silent> <F7> :w<CR>:execute('make ' . strpart(expand('%:p:h'),len($GOPATH)+5))<CR>:copen<CR>
map <silent> <F8> :w<CR>:execute('!go test ' . strpart(expand('%:p:h'),len($GOPATH)+5))<CR>:copen<CR>

" TagBar Golang settings
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
