" Eevee's vimrc

" vim mode preferred!
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" backups
set nobackup                    " backups are annoying
set writebackup                 " temp backup during write
" TODO: backupdir?
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set ignorecase                  " useful more often than not
set smartcase                   " case-sens when capital letters
set number                      " line numbers

" whitespace
set autoindent                  " keep indenting on <CR>
set shiftwidth=4                " one tab = four spaces (autoindent)
set softtabstop=4               " one tab = four spaces (tab key)
set expandtab                   " never use hard tabs
set fileformats=unix,dos        " unix linebreaks in new files please

" gui stuff
set mouse=a                     " terminal mouse when possible
set guifont=Monaco\ 9,DejaVu\ Sans\ Mono\ 10
                                " nice fixedwidth font

" trailing whitespace
hi WhiteSpaceEOL ctermbg=red
match WhiteSpaceEOL /\s\+\%#\@!$/

" unicode
set encoding=utf-8              " best default encoding
setglobal fileencoding=utf-8    " ...
set nobomb                      " do not write utf-8 BOM!
set fileencodings=ucs-bom,utf-8,iso-8859-1
                                " order to detect Unicodeyness

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slightly more complicated settings

" in GUI or color console, enable coloring and search highlighting
if &t_Co > 2 || has("gui_running")
  syntax on
  set background=dark
  set hlsearch
endif

" color
set t_Co=256
colorscheme molokai

if has("autocmd")
  " Filetypes and indenting settings
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

" screen title and mouse
if &term == "screen"
  set titlestring=vim\ %t
  set t_ts=^[k
  set t_fs=^[\
endif
set title

" template detection
" Template Toolkit
au BufNewFile,BufRead *.tt setf tt2html
let b:tt2_syn_tags = '\[% %]'
" Mako
au BufNewFile,BufRead *.mako setf mako

