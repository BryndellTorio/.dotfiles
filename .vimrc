syntax on
packloadall
set wildmenu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
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
set colorcolumn=110
set smartindent
set nocompatible
set wildignore+=*.jpg,.git
filetype plugin indent on
highlight ColorColumn ctermbg=0 guibg=lightgrey
"Stolen from Max Cantor.
"35:29 / 1:14:02, How to Do 90% of What Plugins Do (With Just Vim) talk by Max.
nnoremap ,html :-1read ~/.vim/config/skeletal.html<CR>gg6j0f>a
nnoremap ,link :-1read ~/.vim/config/link.html<CR>0f"a
nnoremap ,lia :read ~/.vim/config/a.html<CR>0f"a
set path+=.,,**
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/plugged')
Plugin 'ycm-core/youcompleteme'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'vim-syntastic/syntastic'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'ternjs/tern_for_vim'
Plugin 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css',
            \         'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
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
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <tab>h :tabprevious<CR>
nnoremap <tab>l :tabnext<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gf :diffget //3<CR>
nnoremap <leader>gh :diffget //2<CR>

au BufRead,BufNewFile *.ino,*.pde,*/src/*.cpp set filetype=arduino

fun! GoYCM()
    nnoremap <buffer><silent><leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer><silent><leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer><silent><leader>rr :YcmCompleter RefactorRename<CR>
endfun

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

fun! GoCoC()
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <silent><expr> <c-space> coc#refresh()

    " GoTo code navigation.
    nmap <buffer><leader>gd <Plug>(coc-definition)
    nmap <buffer><leader>gy <Plug>(coc-type-definition)
    nmap <buffer><leader>gi <Plug>(coc-implementation)
    nnoremap <buffer><leader>gr <Plug>(coc-references)
    nnoremap <buffer><leader>cr :CocRestart
endfun

autocmd FileType typescript :call GoYCM()
autocmd FileType arduino,cpp,cxx,h,hpp,c :call GoCoC()
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
