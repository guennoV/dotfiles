" General configuration {{{1

" Do not show the mode in the command line (it is useless to show it there
" since 'airline' already do it, in a nicest way).
set noshowmode

" Allow virtual editing in Visual block mode
set virtualedit=block

" 1}}}

" nvim Config {{{1
" global config
tnoremap <C-w>h <Esc><C-w>h
tnoremap <C-w>j <Esc><C-w>j
tnoremap <C-w>k <Esc><C-w>k
tnoremap <C-w>l <Esc><C-w>l

" Control cursor styling
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" 1}}}


" cpp setting {{{2

" iN    Indent C++ base class declarations and constructor initializations, if they start in a new line (otherwise they are aligned at the right side of the ':').
set cino=i-s

":N    Place case labels N characters from the indent of the switch().
set cino+=:0

" gN    Place C++ scope declarations N characters from the indent of the block they are in.
set cino+=g0

" mN    When N is non-zero, line up a line starting with a closing parentheses with the first character of the line with the matching opening parentheses.
set cino+=(s,m1

set cino+=(0
" jN    Better support for anonymous classes / functions
set cino+=j1
" JN    Better support for object declarations (bracket initialisation,
" JavaScript object, ...)
set cino+=J1

" 2}}}

" Set the options of SpaceVim.
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80

" set the guifont
let g:spacevim_guifont = 'Terminus\ for\ Powerline\ 11'

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles.
"let g:spacevim_plugin_bundle_dir = '~/.cache/vimfiles'

" Set the SpaceVim cursor shape in the terminal
" Set to 2 to enable blinking mode-sensitive cursor
let g:spacevim_terminal_cursor_shape = 2

" Enable true color support in terminal
let g:spacevim_enable_guicolors = 1

" set SpaceVim colorscheme
let g:spacevim_colorscheme = 'hybrid'

" SpaceVim background colorscheme
let g:spacevim_colorscheme_bg = 'dark'

" Set plugin manager, you want to use, default is dein.vim
let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" use space as `<Leader>`
let mapleader = "\<space>"

" Set windows shortcut leader [Window], default is `s`
let g:spacevim_windows_leader = 's'

" Set unite work flow shortcut leader [Unite], default is `f`
let g:spacevim_unite_leader = 'f'

" Enable YouCompleteMe
"let g:spacevim_enable_ycm = 1

" Enable realtime leader guide
let g:spacevim_realtime_leader_guide = 1

" By default, language specific plugins are not loaded. This can be changed
" with the following, then the plugins for go development will be loaded.
call SpaceVim#layers#load('lang#c')

" Load layers
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('expand-fold')
call SpaceVim#layers#load('incsearch')

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
let g:spacevim_disabled_plugins=[
    \ ]

" Add custom plugins

" gilligan/vim-lldb                     : lldb debugger integration
" myusuf3/numbers.vim                   : toggle intelligently line numbers
" plasticboy/vim-markdown               : markdown syntax plugin
" blueyed/vim-diminactive               : better display for focused / unfocused buffer
" dodie/vim-disapprove-deep-indentation : this plugin disapproves deeply indented code
" ConradIrwin/vim-bracketed-paste       : handles bracketed-paste-mode in vim (aka. automatic `:set paste`)

let g:spacevim_custom_plugins = [
 \ ['gilligan/vim-lldb'],
 \ ['myusuf3/numbers.vim', {'hook_add' : "let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'terminal']"}],
 \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
 \ ['vim-scripts/a.vim', {'on_ft' : 'cpp'}],
 \ ['kien/rainbow_parentheses.vim'],
 \ ['chaoren/vim-wordmotion'],
 \ ['rliang/termedit.nvim'],
 \ ['vhdirk/vim-cmake'],
 \ ['blueyed/vim-diminactive'],
 \ ['dodie/vim-disapprove-deep-indentation'],
 \ ['ConradIrwin/vim-bracketed-paste'],
 \ ['kristijanhusak/vim-hybrid-material'],
 \ ]

" {{{1
" Plugins Configuration

" {{{2
" Startify

" If this option is enabled and you start Vim in a directory that contains a
" `Session.vim`, that session will be loaded automatically.
let g:startify_session_autoload = 1

" Automatically update sessions
let g:startify_session_persistence = 1

" Enable the option only in case you think Vim starts too slowly (because of
" Startify)
let g:startify_enable_unsafe = 1

" 2}}}

" {{{2
" vim-airline

"call airline#parts#define_condition('foo', '&buftype == "terminal"')


"Now add part "foo" to section section airline_section_y: >
"let g:airline_section_y = airline#section#create_right(['ffenc','foo'])

" enable/disable promptline integration >
"let g:airline#extensions#promptline#enabled = 1

" configure the path to the snapshot .sh file. Mandatory option.
"let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"

" 2}}}

" {{{2
" edkolev/promptline.vim
let g:promptline_theme = 'airline'
" sections (a, b, c, x, y, z, warn) are optional
"let g:promptline_preset = {
"    \ 'a' : [ promptline#slices#host({ 'only_if_ssh': 1 }) ],
"    \ 'b' : [ promptline#slices#cwd() ],
"    \ 'c' : [ promptline#slices#vcs_branch() ],
"    \ 'x' : [ promptline#slices#jobs() ],
"    \ 'warn' : [ promptline#slices#last_exit_code() ]
"    \ }

let g:promptline_preset = {
    \ 'a' : [ '$(hostname)' ]
    \ }
" 2}}}

" {{{2
" Airline

function! AirlineTerminal()
    let g:airline_section_a = airline#section#create(['mode'])
endfunction
"autocmd BufEnter * call AirlineTerminal()
" }}}
" {{{2
" Neomake

"let g:neomake_cpp_enabled_makers = ['cmake', 'clang']
let g:neomake_cpp_enabled_makers = ['uavia']

let g:neomake_cpp_uavia_maker = {
    \ 'exe': 'clang++',
    \ 'args': ['-c', '-std=c++11', '-Wall', '-Wextra', '-I', '/home/atem/Documents/Uavia/embedded_dev/build_x86_64-Linux/release/include'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }

let g:neomake_cpp_cmake_maker = {
    \ 'exe': 'cmake',
    \ 'args': ['--build', "$UAVIA_EMBEDDED_BUILD/build_libb2occ"],
    \ 'append_file': 0,
    \ 'errorformat': '%f:%l:%c %m'
    \ }

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': ['-C ../embedded_dev/build_x86_64-Linux4.10.11-1-ARCH/build_coreKit'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }

" 2}}}

" {{{2
" kien/rainbow_parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 1

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
" 2}}}

" {{{2
" wordmotion

" Use g:wordmotion_prefix to apply a common prefix to each of the default word motion mappings.
let g:wordmotion_prefix = '<Leader>'

" 2}}}

" {{{2
" blueyed/vim-diminactive

" Enable (un)dimming windows on Vim's FocusLost and FocusGained events
let g:diminactive_enable_focus = 1

" 2}}}

" {{{2
" dodie/vim-disapprove-deep-indentation 

let g:LookOfDisapprovalTabThreshold=5
let g:LookOfDisapprovalSpaceThreshold=(&tabstop*5)

" 2}}}

" 1}}}

" Terminal config
" ---------------

" The plugin 'numbers.vim' will not be activated on the terminal filetype thus
" we set this value when opening a terminal buffer.
autocmd TermOpen term://* setl filetype=terminal

" To switch to terminal mode automatically.
"autocmd BufEnter term://* startinsert | setl filetype=terminal

" Workspace Setup
" ----------------
function! DefaultWorkspace()
    " Rough num columns to decide between laptop and big monitor screens
    let numcol = 2
    if winwidth(0) >= 220
        let numcol = 3
    endif

    if numcol == 3
        e term://zsh
        file Shell\ Two
        vnew
    endif

    vsp term://zsh
    file Shell\ One
    wincmd k
    resize 4
    wincmd h
endfunction
command! -register DefaultWorkspace call DefaultWorkspace()

