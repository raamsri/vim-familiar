if exists('g:loaded_familiar') || &compatible
  finish
else
  let g:loaded_familiar = 'yes'
endif

if has("autocmd")
  filetype plugin indent on
endif

syntax enable
set modeline
" set tw=79
set fo-=l
set fo+=tcroqj
set ai
set smarttab
set backspace=indent,eol,start
set incsearch
set laststatus=2
set ruler
set wildmenu
set autoread
set complete-=i
set showmatch
set display+=lastline
set background=dark

set tabstop=8
set softtabstop=0
set shiftwidth=8
set noet

inoremap <C-U> <C-G>u<C-U>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  au BufNewFile,BufReadPost *.md set filetype=markdown
endif

if has("autocmd")
  au Filetype c setlocal ts=8 sts=0 sw=8 noet fo-=l fo+=tcroqj
  au Filetype cpp setlocal ts=8 sts=0 sw=8 noet fo-=l fo+=tcroqj
  au Filetype python setlocal ts=8 sts=0 sw=4 et
  au Filetype html setlocal ts=8 sts=0 sw=2 et
  au Filetype javascript setlocal ts=8 sts=0 sw=4 noet
  au Filetype make setlocal noet
  au Filetype markdown setlocal ts=8 sts=0 sw=4 et tw=72 fo-=l fo+=wtcroqj
endif

