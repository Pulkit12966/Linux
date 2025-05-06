" => Chapter 1: Getting Started --------------------------------------- {{{

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based options.

set nocompatible           " Don't run in backwards compatible mode.

set autoindent             " Respect indentation when starting a new line.
autocmd filetype python set expandtab    " Expand tabs to spaces (for Python).
autocmd filetype python set tabstop=4    " Number of spaces tab is counted for.
autocmd filetype python set shiftwidth=4 " Number of spaces for autoindent.

colorscheme murphy         " Change a colorscheme.

set undofile


" => Chapter 2: Advanced Movement and Navigation ---------------------- {{{

silent! helptags ALL            " Load help files for all plugins.

" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

autocmd filetype python set foldmethod=indent " Indentation-based folding.

set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.

" Plugin-related settings below are commented out. Uncomment them to enable
" the plugin functionality once you download the plugins.

" let NERDTreeShowBookmarks = 1   " Display bookmarks on startup.
" autocmd VimEnter * NERDTree     " Enable NERDTree on Vim startup.
" Autoclose NERDTree if it's the only open window left.
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
"   \ b:NERDTree.isTabTree()) | q | endif

" set number                      " Display column numbers.
" set relativenumber              " Display relative column numbers.

set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.

syntax on
filetype plugin indent on
au BufNewFile,BufRead *.yaml,*.yml set filetype=yaml

call plug#begin('~/.vim/plugged')
Plug 'stephpy/vim-yaml'
call plug#end()

Plug 'dense-analysis/ale'
let g:ale_linters = {'sh': ['shellcheck']}

syntax on
filetype plugin indent on
au BufNewFile,BufRead *.sh set filetype=sh

" Enable smooth scrolling
set smoothscroll    " In newer Vim versions (9.0+)

" Set scroll speed
set scrolloff=5     " Keep 5 lines visible above/below cursor

" Enable terraform autocompletion
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
let g:terraform_completion_keys = 1

" VIM AUTOSAVE START

" Set updatetime to 60000 milliseconds (1 minute)
set updatetime=60000

" Auto-save when the cursor is idle (CursorHold event)
augroup auto_save
    autocmd!
    autocmd CursorHold * if &modified && !&readonly && filereadable(bufname('%')) | silent write | endif
augroup END

" VIM AUTOSAVE ENDS
