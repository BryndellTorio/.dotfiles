unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

set path+=**
set wildmenu

set relativenumber


colorscheme darkblue
syntax on


"Used for autoloading a command to command line. Used for html. Stolen from.
"Max Cantor, https://www.youtube.com/watch?v=XA2WjJbmmoM&t=1707s.
nnoremap ,html :-1read C:\Users\GAIA\.config\vim\.skeletal.html<CR>3jwf>a

let g:netrw_banner=0 				"Disable annoying banner.
let g:netrw_browse_split=4 			"Open in prior window.
let g:netrw_altv=1 		 		"Open splits to the right.
let g:netrw_liststyle=3    			"Tree view.
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.config/vim/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on
