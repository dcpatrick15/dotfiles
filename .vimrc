set nocompatible              " be iMproved, required
filetype off                  " required

" ***********************************
" To install, run ':PluginInstall'
" ***********************************
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" go-lang plugin 'vim-go'
Plugin 'fatih/vim-go'

" Auto-pairs
Plugin 'jiangmiao/auto-pairs'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


"Plugin vim-fountain for script writing
Plugin 'kblin/vim-fountain'

" Web Components
Plugin 'styled-components/vim-styled-components'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" personal settings 
set showmatch "Show matching brackets
set ruler
set smarttab
set ts=4 sw=4
set number
let g:go_fmt_command = "gofmt"
