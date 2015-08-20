set fenc=utf-8
scriptencoding utf-8
set encoding=utf-8

let $PATH .= expand(":$HOME/go/bin:$HOME/.path")
let $GOPATH = expand(":$HOME/go")
" Vundle!
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"UI
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'

Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'chrisbra/unicode.vim'

Plugin 'SirVer/ultisnips'

"Languages
Plugin 'fatih/vim-go'
Plugin 'leafgarland/typescript-vim'
Plugin 'ingydotnet/yaml-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'groenewege/vim-less'
Plugin 'gijsk/mozjs-syntax'
Plugin 'sorin-ionescu/vim-htmlvalidator'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'shime/vim-livedown'
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

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

""""
" Numbers
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree', 'netrw']


" Typescript
set rtp+=/usr/local/lib/node_modules/typescript-tools


set splitright
set number
set mouse=a
set t_Co=256


" Tabs by default
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
set list listchars=tab:·\ ,trail:·,extends:>,precedes:>,nbsp:·

" My Maps
noremap <PageUp> :bprev!<CR>
noremap <PageDown> :bnext!<CR>
imap <PageUp> <Nop>
imap <PageDown> <Nop>

" Toggle Vexplore with Ctrl-E
nnoremap <leader>] :NERDTreeToggle<CR>

" Copy and Paste
vnoremap <C-c> "+y
noremap <C-c> "+y
noremap <C-v> "+p

" Lazy shift key :-)
command! W w

function! SetECMA6 ()
	setfiletype ecma6
	setlocal syntax=javascript
endfunction
" Non default file type Load Mappings
augroup fileTypes
	au!
	au BufRead,BufNewFile *.md setlocal filetype=markdown
	au BufRead,BufNewFile *.ts setlocal filetype=typescript
	au BufRead,BufNewFile *.es6 call SetECMA6()
	au FileType html compiler html
augroup END


" Autocomplete like Bash
set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone

" Super Tab
"let g:SuperTabDefaultCompletionType = "<C-x><C-o>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestHighlight = 1

" Colors
if has("gui_running") || &t_Co >= 256
	silent! colorscheme molokai
endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue

set guicursor=n-v-c:block-Cursor
set guicursor=i:ver25-iCursor

" Insert Mode Colors
augroup insertMode
	au!
	au InsertEnter * hi StatusLine term=reverse guifg=Orange guibg=Black
	au InsertLeave * hi StatusLine term=reverse guifg=Black guibg=Green
augroup END

hi StatusLine term=reverse guifg=Black guibg=Green


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
