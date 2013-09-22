""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2

if has("autocmd")
	filetype off
  " Enable filetype detection
  filetype plugin on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
if &t_Co > 2 || has("gui_running")
  " Enable syntax highlighting
  syntax on
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
"Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'git://github.com/tpope/vim-unimpaired.git'
Bundle 'mattn/zencoding-vim'
Bundle 'tristen/vim-sparkup'
Bundle 'vim-ruby/vim-ruby'
Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
Bundle 'flazz/vim-colorschemes'
Bundle 'rollen/vim-potion'
Bundle "pangloss/vim-javascript"
Bundle 'HenningM/cvim-pathogen'
Bundle 'hallettj/jslint.vim'
Bundle 'goatslacker/mango.vim'
Bundle 'Townk/vim-autoclose'
Bundle "myusuf3/numbers.vim"
""""Scala
Bundle 'derekwyatt/vim-scala'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" flazz/vim-colorschemes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme github

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit from insertmode/vmode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <esc>
vnoremap jk <esc>
nnoremap <c-u> viwU<esc>

" captialize word
inoremap <c-u> <esc>viwui 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load vim autocomplete dictionary for node
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup loadnodesyntax
  autocmd!
  autocmd  FileType javascript :set complete
augroup END

let maplocalleader="\\"
let mapleader=","

nnoremap <leader>H <c-w>h
nnoremap <leader>J <c-w>j


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editing vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" nertree mappings
nnoremap <leader>N :NERDTreeToggle<cr>

" search 
:nnoremap gr :grep <cword> *<CR>
:nnoremap Gr :grep <cword> %:p:h/*<CR>
:nnoremap gR :grep '\b<cword>\b' *<CR>
:nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>
:set nu
" ctrl-p extensions
nnoremap <leader>T :CtrlP<cr>

" Make buffer movement keys
nnoremap L <c-w>l
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap H <c-w>h


" enable pasting from clipboard
nnoremap <leader>p "*p

" Kill keys -----{{{
inoremap <esc> <nop>
inoremap <c-c> <nop>
inoremap <c-[> <nop>
nnoremap <c-w><c-w> <nop>
" }}}

" gcc compiler
nnoremap <leader>G : call ComipleGcc()<CR>
func! ComipleGcc()
	exec "w"
	exec "!gcc -Wall %"
endfunc


" quick replace word
nnoremap <leader>rr viw"hy:%s/<C-r>h//gc<left><left><left>

autocmd VimLeave * macaction terminate:

augroup javascriptclosing
	autocmd!
augroup END

au BufRead,BufNewFile *.scala,*.sbt set filetype=scala
au BufRead,BufNewFile *.json set filetype=javascript

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" WINDOW MANAGEMENT
" " ================
map <Bar>   <C-W>v<C-W><Right>
map <C-t>  <C-W>s<C-W><Down>
map <Tab>   <C-W>w
map <C-c>   <C-W>c

