" Global

set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"NVIM_TUI_ENABLE_CURSOR_SHAPE=1 " This option is set in the terminal
                                " configuration file (i.e '.zshrc')

" Background

set background=dark
colorscheme solarized

syntax on " Enable syntax highliting for a better colorscheme experience

" Indentation

set expandtab     " The 'tab' key insert space
set shiftwidth=2  " Number of space use by  (auto)indent
set softtabstop=2 " Number of space inserting with <Tab> but act like real <Tab>

" Folding

set foldenable        " enable folding
set foldlevelstart=0  "value 0 : fold everything, 99 : unfold everything
set foldmethod=marker

" Programming config

set number        " or 'set nu': display line number on the right side

set incsearch     " Search each time you enter a character instead of waiting that you enter the whole string
set hlsearch      " Highlihgt matching search

set cursorline    " Highlight cursor's line
set cursorcolumn  " Highlight cursors's column
hi CursorLine   cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40 guifg=NONE  " Cursor's line apperance option
hi CursorColumn cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40 guifg=NONE  " Cursor's column apperance option

"nnoremap <Leader>c set cursorline! cursorcolumn!<CR>
"augroup CursorLine
"  au!
"  au WinLeave * <Leader>c
"augroup END


" Plugin {{{1
" Vundle {{{2
set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             " Vim plugin manager
Plugin 'Valloric/YouCompleteMe'           " Auto complete tools for C familly
Plugin 'easymotion/vim-easymotion'        " For moving in file
Plugin 'altercation/vim-colors-solarized' " Solarized theme
Plugin 'plasticboy/vim-markdown'          " Markdown
Plugin 'a.vim'                            " To easily switch between source and header file
Plugin 'terryma/vim-multiple-cursors'     " Sublime Text's multiple cursor for vim
Plugin 'Townk/vim-autoclose'              " Close automatically character '()', '[]', etc
Plugin 'Shougo/deoplete.nvim'             " Auto complete for Neovim
Plugin 'neomake/neomake'                  " Asynchronous :make for Neovim
Plugin 'vim-airline/vim-airline'          " Custom status bar
Plugin 'vim-airline/vim-airline-themes'   " Custom themes for the vim-airline plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append  to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append  to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append  to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" VundleVim/Vundle 2}}}

" Valloric/YouCompleteMe {{{2
" Python support
let g:python_host_prog = '/bin/python2'

" Set the Python 3 interpreter
let g:python3_host_prog = 'usr/bin/python3'

" Valloric/YouCompleteMe 2}}}

" Shougo/deoplete {{{2
" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Shougo/deoplete 2}}}

" neomake/neomake {{{2
" Call neomake each time data are written
autocmd! BufWritePost *.cpp Neomake! make

" Makefile maker
let g:neomake_make_maker = {
  \ 'args': ['-C', 'build', '%f'],
  \ 'errorformat': '%f:%l:%c: %m',
  \ }

" Debug information flag
let g:neomake_verbose = 3
" neomake/neomake 2}}}

" vim-airline/vim-airline {{{2

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '☰'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

" 2}}}

" Plugin 1}}}

" Auto guard scope code
au BufNewFile,BufRead *.c,*.cc,*.C,*.h,*.cpp,*.hpp imap } <Esc>:call CurlyBracket()<CR>a

function CurlyBracket()
  let l:my_linenum = line(".")
  iunmap }
  sil exe "normal i}"
  imap } <Esc>:call CurlyBracket()<CR>
  let l:result1 = searchpair('{', '', '}', 'bW')
  if (result1 > 0)
    let l:my_string = substitute(getline("."), '^\s*\(.*\){', '\1', "")
    sil exe ":" . l:my_linenum
    sil exe "normal a //" . l:my_string
  endif
 endfunction

