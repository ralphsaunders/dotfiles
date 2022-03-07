" Ale (linting) config
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_filetype_changed=0
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Install plugins
execute pathogen#infect()

" Plugins for quick copy pasta
" Install pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle && \
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
" Install plugins
" git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes && git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline && git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/bundle/editorconfig-vim && git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized && git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree && git clone https://github.com/andreshazard/vim-freemarker.git ~/.vim/bundle/vim-freemarker.vim && git clone https://github.com/cakebaker/scss-syntax.vim.git ~/.vim/bundle/scss-syntax && git clone https://github.com/elzr/vim-json.git ~/.vim/bundle/vim-json
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'
" Initialize plugin system
call plug#end()

" Something to do with Vi
set nocompatible

" Set font (gvim)
if has('gui_running')
  set guifont=Monaco:h12
  colorscheme solarized
  set background=light
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

" Filetype detection
filetype on
filetype plugin on
filetype plugin indent on

" Sass files get 4 space indent (overridden by .editorconfig with pathogen)
autocmd FileType scss setlocal shiftwidth=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

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

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" This shows what you are typing as a command.  I love this!
set showcmd

" Status line (uncomment if no airline installed)
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Airline for vim should always display
" set laststatus=2

" Airline theme
let g:airline_theme='solarized'

" RNU in NERDTree pls
let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu

" Highlight search
set hls

" Improve gf file finding
set path=.,src,node_modules
set suffixesadd=.js,.scss
function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)
