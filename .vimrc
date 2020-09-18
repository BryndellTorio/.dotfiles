syntax on
set backspace=indent,eol,start
set wildmenu
set nowrap
set relativenumber
set smartcase
set spell
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf-8
set colorcolumn=80
set smartindent
set nocompatible
set wildignore+=*.jpg,.git
filetype plugin on
filetype plugin indent on
highlight ColorColumn ctermbg=0 guibg=lightgrey
"Stolen from Max Cantor.
"35:29 / 1:14:02, How to Do 90% of What Plugins Do (With Just Vim) talk by Max.
set path+=**
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/plugged')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'gruvbox-community/gruvbox'
Plugin 'jremmen/vim-ripgrep'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'prettier/vim-prettier', {
			\ 'do': 'yarn install',
			\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plugin 'vim-syntastic/syntastic'
Plugin 'ycm-core/youcompleteme'
call vundle#end()

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

" if exists('+termguicolors') 
" 	let &t_8f = '\<Esc>[38;2;%lu;%lu;%lum'
" 	let &t_8b = '\<Esc>[48;2;%lu;%lu;%lum'
" endif
colorscheme gruvbox
set background=dark

if executable('rg')
	let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
let mapleader = " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar>:Ex<bar>:vertical resize 120<CR>
nnoremap <leader>vr :vertical resize 120<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>
nnoremap <leader>vim :e $MYVIMRC<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <tab><left> :tabprevious<CR>
nnoremap <tab><right> :tabnext<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

nnoremap ,html :-1read ~/.vim/config/skeletal.html<CR>gg7jf>a
nnoremap ,b :read ~/.vim/config/break-tag.html<CR>kJ==f<f<i
nnoremap ,str :read ~/.vim/config/strong.html<CR>kJ==f<f<i
nnoremap ,a :read ~/.vim/config/a.html<CR>kJ==f<f"a
nnoremap ,lia :read ~/.vim/config/lia.html<CR>kJ==^f"a

au BufRead,BufNewFile *.ino,*.pde,*/src/*.cpp set filetype=arduino
autocmd BufWritePre *.css,*.html,*.py,*.ino,*/src/*.cpp :%s/\s\+$//e

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
