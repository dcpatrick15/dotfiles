"Pathogen
execute pathogen#infect('bundle/{}','~/.vim/bundle/{}')
" Line Count Stuff
filetype plugin indent on
syntax on
"Omnicomplete that doesn't work
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set smartindent
set ignorecase 
set number
"Fortran Stuff
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_do_enddo=1
"autocmd BufReadPost *.doc,*.docx,*.rtf,*.odp,*.odt silent %!pandoc "%" -tplain -o /dev/stdout
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
"Nerdtree
autocmd vimenter * NERDTree
set fileformat=unix
"Filters out ^M
"%s/\r//
