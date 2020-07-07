syntax on
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
Plugin 'sudar/vim-arduino-syntax'
Plugin 'ycm-core/youcompleteme'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
call vundle#end()

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

au BufRead,BufNewFile *.ino,*.pde,*/src/*.cpp set filetype=arduino
autocmd BufWritePre *.css,*.html,*.py,*.ino,*/src/*.cpp :%s/\s\+$//e

fun! GoYCM()
        nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
        nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
        nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

fun! GoCoC()
        inoremap <buffer><silent><expr> <TAB>
                                \ pumvisible() ? "\<C-n>" :
                                \ <SID>check_back_space() ? "\<TAB>" :
                                \ coc#refresh()

        inoremap <buffer><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
        inoremap <buffer><silent><expr> <c-space> coc#refresh()

        nmap <buffer> <leader>gd <Plug>(coc-definition)
        nmap <buffer> <leader>gy <Plug>(coc-type-definition)
        nmap <buffer> <leader>gi <Plug>(coc-implementation)
        nmap <buffer> <leader>gi <Plug>(coc-references)
        nnoremap <buffer> <leader>cr :CocRestart
endfun

autocmd FileType typescript,javascript :call GoYCM()
autocmd FileType cpp,cxx,h,hpp,c :call GoCoC()

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let g:prettier#quickfix_enabled = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

if isdirectory('/usr/include/c++/9')
	set path+=/usr/include/c++/9
elseif isdirectory('/mnt/c/Users/GAIA/.platformio/packages/framework-arduino-avr/cores/arduino')
	set path+=/mnt/c/Users/GAIA/.platformio/packages/framework-arduino-avr/cores/arduino
endif
