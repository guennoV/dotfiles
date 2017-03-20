
" Set the options of SpaceVim.
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80

" set the guifont
let g:spacevim_guifont = 'Terminus\ for\ Powerline\ 11'

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles.
"let g:spacevim_plugin_bundle_dir = '~/.cache/vimfiles'

" set SpaceVim colorscheme
let g:spacevim_colorscheme = 'NeoSolarized'

" Set plugin manager, you want to use, default is dein.vim
let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" use space as `<Leader>`
let mapleader = "\<space>"

" Set windows shortcut leader [Window], default is `s`
let g:spacevim_windows_leader = 's'

" Set unite work flow shortcut leader [Unite], default is `f`
let g:spacevim_unite_leader = 'f'

" By default, language specific plugins are not loaded. This can be changed
" with the following, then the plugins for go development will be loaded.
call SpaceVim#layers#load('lang#cpp')

" Load ui layer
call SpaceVim#layers#load('ui')

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
let g:spacevim_disabled_plugins=[
    \ ]

" Add custom plugins

" edkolev/promptline.vim
" gilligan/vim-lldb         : lldb debugger integration
" myusuf3/numbers.vim       : toggle intelligently line numbers
" plasticboy/vim-markdown   : markdown syntax plugin
let g:spacevim_custom_plugins = [
 \ ['edkolev/promptline.vim'],
 \ ['gilligan/vim-lldb'],
 \ ['myusuf3/numbers.vim'],
 \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
 \ ['vim-scripts/a.vim', {'on_ft' : 'cpp'}],
 \ ['kien/rainbow_parentheses.vim'],
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
"let g:startify_enable_unsafe = 1

" 2}}}

" {{{2
" vim-airline

"call airline#parts#define_condition('foo', '&buftype == "terminal"')


"Now add part "foo" to section section airline_section_y: >
"let g:airline_section_y = airline#section#create_right(['ffenc','foo'])

" enable/disable promptline integration >
let g:airline#extensions#promptline#enabled = 1

" configure the path to the snapshot .sh file. Mandatory option.
let g:airline#extensions#promptline#snapshot_file = "~/.shell_prompt.sh"

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

let g:neomake_cpp_enabled_makers = ['cmake', 'clang']

let g:neomake_cpp_cmake_maker = {
    \ 'exe': 'cmake',
    \ 'args': ['--build', 'libb2occ/cmake-build-debug'],
    \ 'append_file': 0,
    \ 'errorformat': '%f:%l:%c %m'
    \ }

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': ['-C libb2occ/cmake-build-debug'],
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

let g:rbpt_loadcmd_toggle = 0

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces
" 2}}}

" 1}}}

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

