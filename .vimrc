function! Run()
	:w
	:!clang -O2 % -o %:r -lm
	:q
endfunction

function! Grun()
	:w
	:!g++ -std=c++11 -o %:r % -Wall -O2 -g -DDEBUG
endfunction

function! Nspace()
	:%s/ *$//
endfunction

:set encoding=utf-8
:set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
:set fileformats=unix,dos,mac

colorscheme ron

command! Gcc call Run()
command! Gpp call Grun()
command! Nsp call Nspace()

set clipboard=unnamed,autoselect
colorscheme ron

"For C/C++ programming
:set autoindent
:set smartindent
:set number

autocmd BufNewFile  *.c           0r ~/.vim/skeleton.c
autocmd BufNewFile  *.cpp         0r ~/.vim/skeleton.cpp
autocmd BufNewFile,BufRead *.c    set cindent
autocmd BufNewFile,BufRead *.cpp  set cindent
autocmd BufNewFile,BufRead *.log  set hlsearch
autocmd BufNewFile,BufRead *.sh   set shiftwidth=2
"autocmd BufNewFile,BufRead *.txt  set nonumber

"Related Gtags
map <C-g> :Gtags
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"VimShell
map <space>s :vnew<CR>:VimShell<CR>

" binary edit mode (vim -b
augroup BinaryXXD
autocmd!
autocmd BufReadPre  *.bin let &binary =1
autocmd BufReadPost * if &binary | silent %!xxd -g 1
autocmd BufReadPost * set ft=xxd | endif
autocmd BufWritePre * if &binary | %!xxd -r | endif
autocmd BufWritePost * if &binary | silent %!xxd -g 1
autocmd BufWritePost * set nomod | endif
augroup END


" For search something
augroup HighlightTrailingSpaces
autocmd!
autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" For Python
" Change Character Color
autocmd BufNewFile,BufRead *.py  set list lcs=tab:\|\ 

" quickrun
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nmap <F9> :QuickRun<CR>


let g:quickrun_config = {
\"_" : {
	\ "runner" : "vimproc",
	\ "runner/vimproc/updatetime" : 60,
	\ "outputter/buffer/split" : ":vnew"
\}
\}


let g:quickrun_config["c"] = {
	\ "type" : "c",
	\ "command" : "clang",
	\ "cmdopt" : "-O2 -lm",
\}

let g:quickrun_config["cpp"] = {
	\ "type" : "cpp",
	\ "command" : "clang",
	\ "cmdopt" : "-O2 -lm",
\}

let g:quickrun_config["python"] = {
	\ "type" : "python",
	\ "command" : "python3",
\}


""dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/.vim/dein')

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " Add or remove your plugins here:
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

  " You can specify revision/branch/tag.

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""End dein Scripts-------------------------
