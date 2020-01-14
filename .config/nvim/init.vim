" Plug configurations "{{{
if has('win32') || has('win64')
  let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
  let g:plugged_home = '~/.vim/plugged'
endif

" Plugins List
call plug#begin(g:plugged_home)

  " UI related
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'
  Plug 'jiangmiao/auto-pairs'
  " Better Visual Guide
  Plug 'Yggdroot/indentLine'

  " git
  Plug 'airblade/vim-gitgutter'

  " syntax check
  Plug 'w0rp/ale'

  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-bufword'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-jedi'

  " Float terminal "
  Plug 'voldikss/vim-floaterm'
  " Formater
  Plug 'Chiel92/vim-autoformat'
  " NerdTree
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype plugin indent on
"}}}

" Configurations Part "{{{

" UI configuration "
syntax on
syntax enable

" colorscheme "
let base16colorspace=256
let g:gruvbox_italic=1
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
set background=dark

" True Color Support if it's avaiable in terminal "
if has("termguicolors")
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
set relativenumber
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw
set encoding=utf-8                " utf-8 by default
set showmatch                     " shows matching part of bracket pairs (), [], {}
set backspace=indent,eol,start    " backspace removes all (indents,EOLs, start) What is start?
set ruler                         " show row ruler
set ttyfast                       " terminal acceleration
set cursorline                    " shows line under the cursor's line
set scrolloff=10                  " let 10 lines before/after cursor during scroll
set clipboard=unnamed             " use system clipboard

" Turn off backup "
set nobackup
set noswapfile
set nowritebackup
"

" Search configuration "
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase
"

" Tab and Indent configuration "
set tabstop=4                     " 4 whitespaces for tabs visual presentation
set shiftwidth=4                  " shift lines by 4 spaces
"set smarttab                     " set tabs for a shifttabs logic
set expandtab                     " expand tabs into spaces
set autoindent                    " indent when moving to the next line while writing code

" Folding with marker "
set foldmethod=marker
set foldcolumn=3
"
" Kill arrow keys "
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

"Flagging Unnecessary Whitespace "
autocmd BufWritePre * %s/\s\+$//e
"

" vim-autoformat "
noremap <F3> :Autoformat<CR>

" StripTrailingWhitespace function"
command! -nargs=? -range=% -complete=custom,s:StripCompletionOptions
      \ StripTrailingWhitespace <line1>,<line2>call s:StripTrailingWhitespace(<f-args>)

function! s:StripTrailingWhitespace(...) abort
  let confirm = a:0
  execute a:firstline . ',' . a:lastline . 's/\s\+$//e' . (confirm ? 'c' : '')
endfunction

function! s:StripCompletionOptions(A,L,P) abort
  return "-confirm"
endfunction
"}}}

" NCM2{{{
augroup NCM2
  autocmd!
  " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
  " found' messages
  set shortmess+=c

  " Use <TAB> to select the popup menu:
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



  " enable ncm2 for all buffers
  autocmd BufEnter * call ncm2#enable_for_buffer()

  " :help Ncm2PopupOpen for more information
  set completeopt=noinsert,menuone,noselect

  " When the <Enter> key is pressed while the popup menu is visible, it only
  " hides the menu. Use this mapping to close the menu and also start a new line.
  inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

  " uncomment this block if you use vimtex for LaTex
  " autocmd Filetype tex call ncm2#register_source({
  "           \ 'name': 'vimtex',
  "           \ 'priority': 8,
  "           \ 'scope': ['tex'],
  "           \ 'mark': 'tex',
  "           \ 'word_pattern': '\w+',
  "           \ 'complete_pattern': g:vimtex#re#ncm2,
  "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
  "           \ })
augroup END
"}}}

" Ale{{{
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" Check Python files with flake8 and pylint.
let g:ale_linters = {'python': ['flake8', 'pylint']}
" Fix Python files with autopep8 and yapf.
let g:ale_fixers = ['autopep8', 'yapf']
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

" NERDTree configurations "{{{
let NERDTreeIgnore=['\.pyc$', '\.pyo$']     " Ignore files in NERDTree
let NERDTreeWinSize=40
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-\> :NERDTreeToggle<CR>
"}}}

" Vim-floatterm " {{{
let g:floaterm_type          = 'floating'
let g:floaterm_position      = 'center'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_background    = '#2E3436'
"}}}

" GitGutter Configurations "{{{
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
" Update sign column every quarter second
set updatetime=250

" }}}

