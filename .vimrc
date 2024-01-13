syntax on               " enable syntax highlighting
set cursorline          " highlight the current line
" set background=dark   " darker color scheme
" set ruler             " show line number in bar
set nobackup            " don't create pointless backup files; Use VCS instead
set autoread            " watch for file changes
set number              " show line numbers
set showcmd             " show selection metadata
set showmode            " show INSERT, VISUAL, etc. mode
set showmatch           " show matching brackets
set autoindent smartindent  " auto/smart indent
set smarttab            " better backspace and tab functionality
set scrolloff=5         " show at least 5 lines above/below
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

" bells
set noerrorbells        " turn off audio bell
set visualbell          " but leave on a visual bell
set belloff=all

call plug#begin()

  Plug 'junegunn/fzf.vim'
  Plug 'preservim/nerdtree'
  Plug 'LunarWatcher/auto-pairs'
  Plug 'rust-lang/rust.vim'
  Plug 'maxboisvert/vim-simple-complete'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-rsi'
  Plug 'tpope/vim-rhubarb'
  Plug 'tpope/vim-dispatch'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sheerun/vim-polyglot'
call plug#end()


let mapleader = ","
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeIgnore = ['\.pyc$', '\~$', '\.swp$']

nnoremap <silent><Leader>c :put =printf('console.log(''🚀 %s:'',  %s);', expand('<cword>'), expand('<cword>'))<CR>

nnoremap <silent><Leader>d :put =printf('dd(''🚀 %s:'',  %s);', expand('<cword>'), expand('<cword>'))<CR>

syntax enable
colorscheme dracula

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <Leader>t :split | terminal<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap - :delete<CR>:put<CR>
nnoremap _ :delete<CR>:put!<CR>
