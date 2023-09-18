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
" Include Phpactor
  Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
  
" Require ncm2 and this plugin
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'phpactor/ncm2-phpactor'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'sheerun/vim-polyglot'
 " Plug 'Eliot00/git-lens.vim'
call plug#end()

let g:AutoPairsShortcutToggle = '<C-P>'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_zoom = 1
let g:airline_statusline_ontop=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s'
let g:airline_powerline_fonts = 1

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

"let g:gitlens_enabled = 1 

"let g:GIT_LENS_CONFIG = {
 "   \ 'blame_prefix': '----',
  "  \ 'blame_highlight': 'YourHighlight',
  "  \ 'blame_wrap': 0,
  "  \ 'blame_empty_line': 0
  "  \ }

" autocmd VimEnter * echo "(>^.^<) Meow! Welcome to Vim!"
