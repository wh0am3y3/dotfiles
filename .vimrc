"Vundle script {{{
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'                " Project and file navigation

Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-obsession.git'
Plugin 'airblade/vim-gitgutter'

"Auto-Complete
Plugin 'valloric/YouCompleteMe'

"syntax checking
"Plugin 'vim-syntastic/syntastic'
"Plugin 'nvie/vim-flake8'
Bundle 'tpope/vim-fugitive'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}

"AirlineThemes (StatusLine){{{
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
"let g:tmuxline_preset = 'nightly_fox'
"let g:tmuxline_preset = 'powerline'
"}}}

" indent and tabs for specific files {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set smartindent
"}}}

"General settings {{{
set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
"set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

"Flagging Unnecessary Whitespace
autocmd BufWritePre * %s/\s\+$//e


set t_Co=256                                " set 256 colors
colorscheme solarized8_dark
set background=dark
set laststatus=2
set number                                  " show line numbers
set ruler                                   " show row ruler
set ttyfast                                 " terminal acceleration
set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}
set encoding=utf-8                          " utf-8 by default
set nobackup                                " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files
set backspace=indent,eol,start              " backspace removes all (indents,EOLs, start) What is start?
set scrolloff=10                            " let 10 lines before/after cursor during scroll
set clipboard=unnamed                       " use system clipboard
set showmatch                               " highlight matching [{()}]
set wildmenu
set wildmode=full
set showtabline=2

let python_highlight_all=1
syntax on

"}}}

"syntastic settings {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_enable_signs=2
"let g:syntastic_check_on_wq=0
"let g:syntastic_aggregate_errors=1
"let g:syntastic_error_symbol='X'
"let g:syntastic_style_error_symbol='X'
"let g:syntastic_warning_symbol='x'
"let g:syntastic_style_warning_symbol='x'
"let g:syntastic_python_checkers = ['python', 'pep8', 'pyflakes', 'pylint']
"}}}

" ALE Lint checking {{{
" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_options="--ignore=E501"
"}}}

" Folding with marker {{{
set foldmethod=marker
set foldcolumn=3
"}}}


" Auto-complete {{{
let g:ycm_path_to_python_interpreter = ''
"let g:ycm_python_binary_path = ''
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_invoke_completion = '<C-Space>'
"}}}

" Test Script for detecting python enviroment with YCM
"========================================================{{{
" Point YCM to the Pipenv created virtualenv, if possible
" At first, get the output of 'pipenv --venv' command.
"let pipenv_venv_path = system('pipenv --venv')
" The above system() call produces a non zero exit code whenever
" a proper virtual environment has not been found.
" So, second, we only point YCM to the virtual environment when
" the call to 'pipenv --venv' was successful.
" Remember, that 'pipenv --venv' only points to the root directory
" of the virtual environment, so we have to append a full path to
" the python executable.
"if shell_error == 0
"  let venv_path = substitute(pipenv_venv_path, '\n', '', '')
"let g:ycm_python_binary_path = venv_path . '/bin/python'
"else
"  let g:ycm_python_binary_path = 'python'
"endif
"}}}

" NERDTree settings {{{

" }}}

