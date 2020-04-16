syntax on

set wildmenu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Stolen from Max Cantor, AE
"5
"35:29 / 1:14:02, How to Do 90% of What Plugins Do (With Just Vim) talk by Max.
nnoremap ,html :-1read /mnt/c/Users/GAIA/.config/vim/.skeletal.html<CR>3jwf>a

set path+=**

set nocompatible
filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'jremmen/vim-ripgrep'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-utils/vim-man'
Plugin 'lyuts/vim-rtags'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25

let g:ctrlp_use_caching=0

let g:ycm_global_ycm_extra_conf="~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py"

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :vertical resize 120<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>


nnoremap <silent><leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent><leader>gf :YcmCompleter FixIt<CR>
