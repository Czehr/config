set number
set hlsearch

"Remove delay when exiting visual mode
set timeoutlen=1000 ttimeoutlen=0

"Tab is 4 spaces
set ai
set ts=4
set sw=4
set et

set nocompatible
filetype plugin on
syntax on

set background=dark

"Install plugin manager if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
call plug#end()

autocmd VimEnter * AirlineToggleWhitespace

colorscheme gruvbox
