set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab  " Proper indents
set t_Co=256  " 256 colors
set termguicolors
set number  " Show line numbers

syntax on
filetype plugin indent on

" Install vim-plug if it doesn't exist
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'avakhov/vim-yaml'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'erig0/cscope_dynamic'
Plug 'fatih/vim-go'
Plug 'felixhummel/setcolors.vim'
Plug 'flazz/vim-colorschemes'
Plug 'fsharpasharp/vim-dirvinist'
Plug 'idanarye/vim-merginal'
Plug 'itchyny/vim-haskell-indent'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'kien/ctrlp.vim'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'lifepillar/vim-mucomplete'
Plug 'majutsushi/tagbar'
Plug 'mattn/webapi-vim'
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'mhinz/vim-grepper'
Plug 'neomake/neomake'
Plug 'noah/vim256-color'
Plug 'rakr/vim-one'
Plug 'rust-lang/rust'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/cscope_macros.vim'
Plug 'w0rp/ale'

" Initialize plugin system
call plug#end()

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Configure color scheme
color evening
let g:gruvbox_contrast_dark='hard'
set background=dark
set colorcolumn=80,120  " Right margins
hi SpellBad ctermbg=088 ctermfg=255 guibg=800000 guifg=870000

" Neomake
call neomake#configure#automake('rw')
let g:neomake_open_list = 2

" Autocomplete
set completeopt+=menuone
set completeopt+=noselect
let g:mucomplete#enable_auto_at_startup = 1

" Haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" FZF
set hidden
let g:fzf_buffers_jump = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'FZF'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,vendor/*
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" Rust
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
let g:rustfmt_autosave = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Salt
autocmd BufNewFile,BufRead *.sls set filetype=yaml

" Disable Esc-delay
set timeoutlen=1000 ttimeoutlen=0

" ctags
set tags=tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Window management
:set splitright  " Always open windows to the right

