unlet! skip_defaults_vim
source $VIMRUNTIME/debian.vim

"Powerline Configuration.
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

"Stolen from Max Cantor, https://www.youtube.com/watch?v=XA2wjJbmmoM&t=1707s.
nnoremap ,html :-1read /mnt/c/Users/GAIA/.config/vim/.skeletal.html<CR>3jwf>a

let g:netrw_banner=0				" Disable annoying banner.
let g:netrw_browse_split=4			" Open in prior window.
let g:netrw_altv=1				" Open splits to the right.
let g:netrw_liststyle=3				" Tree view.
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

"General Plugins
filetype off

colo darkblue
syntax on


set path+=**

set nocompatible
set relativenumber
set wildmenu


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/.vimconfig/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'powerline/powerline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

"NOTE:
"  - Fixing (+)Python run this command probably only in Debian, sudo apt install
"    vim-gtk.
"  - If you desire to create your own custom powerline study this Link:https://devpro.media/custom-powerline-segment/#testing-the-custom-segment
