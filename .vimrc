" Install plugin manager if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
call plug#end()

" Basics
set nocompatible
filetype plugin on
syntax on

" Colors
set background=dark
colorscheme gruvbox

" This is awesome
set number relativenumber

" Incremental highlighted search
set hlsearch
set incsearch

" Splits open at the bottom and right
set splitbelow splitright

" Tab is always 4 spaces
set ai
set ts=4
set sw=4
set et

" Enable autocompletion for ex commands
set wildmode=longest,list,full

" Remove delay when exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Don't show whitespace in vim-airline
autocmd VimEnter * AirlineToggleWhitespace
