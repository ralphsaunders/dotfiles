" Install plugins
execute pathogen#infect()

" Plugins for quick copy pasta
" git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes && git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline && git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim && git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized && git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree && git clone https://github.com/beyondwords/vim-twig ~/.vim/bundle/vim-twig && git clone https://github.com/ervandew/supertab.git ~/.vim/bundle/supertab

" Something to do with Vi
set nocompatible

" Set font (gvim)
if has('gui_running')
  set guifont=Monaco:h11
  colorscheme solarized
endif

" Hide toolbars (gvim)
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" Stop breaks in the middle of words
:set linebreak

" For readability
set colorcolumn=80
set textwidth=80

" Add line numbers + relative numbers
:set nu
:set rnu

" Set Default Tab settings (spaces ftw)
:set smartindent
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab

" Sass files get 2 space indent (overridden by .editorconfig with pathogen)
autocmd FileType scss setlocal shiftwidth=2 tabstop=2

" Filetype detection
filetype on
filetype plugin on

" Syntax highlighting
syntax on
syntax enable

" Set grep to grep (used with ":grep")
set grepprg=grep\ -nH\ $*

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
    " Toggle spell checking on and off with `,s`
    let mapleader = ","
    nmap <silent> <leader>s :set spell!<CR>

    " Set region to British English
    set spelllang=en_gb
endif

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Autocomplete options
set completeopt=menu,longest,preview
set complete=.,w,b,u,U,t,i,d

" Toggle line endings ,l
nmap <leader>l :set list!<CR>

" Set line ending characters
set listchars=tab:?\ ,eol:¬

" When I close a tab, remove the buffer
set nohidden

" Backup those backup files somewhere else
set backupdir=/tmp
set directory=/tmp
set undodir=/tmp

" Turn error bells off
set noerrorbells
set visualbell
set t_vb=

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This shows what you are typing as a command.  I love this!
set showcmd

" Status line (uncomment if no airline installed)
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Airline for vim should always display
set laststatus=2

" Airline theme
let g:airline_theme='solarized'

" RNU in NERDTree pls
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu

" Highlight search
set hls
