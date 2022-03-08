" vim:foldmethod=marker

" cterdam.vimrc: cterdam's own vimrc file.
" See https://github.com/cterdam/dotfiles

" BUILTIN --------------------------------------------------------------------

" GENERAL {{{

" Do no weird things and welcome to the 21st century
set nocompatible

" Save view when leaving
autocmd BufWinLeave ?* silent! mkview

" Load view when entering
autocmd BufWinEnter ?* silent! loadview

" Detect file type; load filetype plugin and indent setting
filetype plugin indent on

" Activate lexical coloring
syntax on

" Enable modeline
set modeline

" Read modeline on top and bottom 5 lines, as default
set modelines=5

" More powerful backspace
set backspace=indent,eol,start

" Update working directory to that containing current file
set autochdir

" Update file if changed outside Vim
set autoread

" Enable command completion
set wildmenu

" Secure the default \ as mapleader
let mapleader='\'

" <Leader>p to toggle in and out of paste mode
set pastetoggle=<Leader>p

" Do not timeout on ':'mappings or key codes
set notimeout nottimeout

" COC TextEdit might fail if hidden is not set.
" See COC README sample config.
set hidden

" COC uses some unicode characters in the file autoload/float.vim
" See COC README sample config.
set encoding=utf-8

" }}}
" INTERFACE {{{

" Always show at least 5 lines above/below cursor when available
set scrolloff=5

" Show command in the bottom right as you type
set showcmd

" Underscore the current line the cursor is on
set cursorline

" Supply text color suitable for a dark background
set background=dark

" Make sign column black for use by vim-gitgutter
highlight SignColumn ctermbg=black ctermfg=yellow

" }}}
" LINE NUMBER {{{

" Display line numbers
set number

" Display line number as difference from current line
set relativenumber

" <Leader><Return> to toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunction
map <Leader><Return> :call ToggleNumber()<CR>

" Color the line numbers dark
highlight LineNr ctermfg=darkgrey

" }}}
" WIDTH & WRAP {{{

" Keep your line within 80 chars
set colorcolumn=81

" Break lines longer than 78 chars. Vim forces this to 78 anyways
set textwidth=78

" Do not horizontally extend a line past screen boundary
set wrap

" Do not break words over lines
set linebreak

" Mark the beginning of a continued line
set showbreak=↳

" }}}
" INDENT & TABS  {{{

" Store tabs as spaces
set expandtab

" One tab inputs four spaces
set tabstop=4

" Setting softtabstop=tabstop thus effectively disabling soft tabs
set softtabstop=4

" >, <, and = all shift/reindent by 4 spaces per level
set shiftwidth=4

" Indent continued lines to preserve horizontal blocks
set breakindent

" Inherit indentation from preceding line
set autoindent

" Insert indent based on some C syntax
set smartindent

" }}}
" SEARCH {{{

" Incrementally show search results while typing the search term
set incsearch

" Highlight search results throughout text
set hlsearch

" <Leader>/ to clear highlight
map <Leader>/ :nohl<CR>

" To be or not to be is the question...
set ignorecase

" }}}
" SWAPPING {{{

" These are currently buggy:
" Swapping the leftmost 2 chars to the left can cause the char to disappear.
" Swapping lines will lose the current column.
" TODO: Fix these and write them into a Vim plugin
" TODO: swap words and not chars

" <Ctrl>h to swap a char to the left
:nnoremap <silent><C-h> :let save_a=@a<Cr>"axhh"ap:let @a=save_a<Cr>

" <Ctrl>j to swap a line down
:nnoremap <silent><C-j> :let save_a=@a<Cr>"add"ap:let @a=save_a<Cr>

" <Ctrl>k to swap a line up
:nnoremap <silent><C-k> :let save_a=@a<Cr><Up>"add"ap<Up>:let @a=save_a<Cr>

" <Ctrl>l to swap a char to the right
:nnoremap <silent><C-l> :let save_a=@a<Cr>"ax"ap:let @a=save_a<Cr>

" }}}
" FOLD {{{

" Fold level is equal to indentation divided by shiftwidth (round down)
set foldmethod=indent

" Do not ignore lines starting with '#', or any character
set foldignore=

" Enable folds by default, can be toggled with 'zi'
set foldenable

" Display fold level on the leftmost one column
set foldcolumn=1

" Press <Space> to toggle current fold
nnoremap <Space> za

" Supply color for the fold column
highlight FoldColumn ctermbg=darkgrey ctermfg=white

" Supply color for the folded lines
highlight Folded ctermbg=darkgrey ctermfg=white

" }}}
" UNDO FILE {{{

" Save undo history
set undofile

" Remember 100 operations
set history=100

" Ensure that undodir exists
if !isdirectory($HOME . "/.vim/undo")
    call mkdir($HOME . "/.vim/undo", "p")
endif

" Set undodir and include full pathname for unfo files
set undodir=$HOME/.vim/undo//

" }}}
" BACKUP FILE {{{

" Make a backup before overwriting a file
" Turned off because some COC servers have issues with backup files.
" See COC README sample config.
set nowritebackup

" Do not save that backup file upon successful overwrite
" Kept off because some COC servers have issues with backup files.
" See COC README sample config.
set nobackup

" Ensure that backupdir exists
if !isdirectory($HOME . "/.vim/backup")
    call mkdir($HOME . "/.vim/backup", "p")
endif

" Set backupdir and include full pathname for backup files
set backupdir=$HOME/.vim/backup//

" }}}
" SWAP FILE {{{

" Make a swap file to prepare for a crash
set swapfile

" Update the swap file every 100 characters
set updatecount=100

" If for 100 miliseconds nothing is typed, write the swap file
" This also governs such other update events as gitgutter update
set updatetime=100

" Ensure that swapdir exists
if !isdirectory($HOME . "/.vim/swap")
    call mkdir($HOME . "/.vim/swap", "p")
endif

" Set swapdir (option named dir) and include full pathname for swap files
set dir=$HOME/.vim/swap//

" }}}
" LOCATION LIST {{{

" <Leader>l<n> to switch to the nth location in the list
map <Leader>l1 :ll 1<CR>
map <Leader>l2 :ll 2<CR>
map <Leader>l3 :ll 3<CR>
map <Leader>l4 :ll 4<CR>
map <Leader>l5 :ll 5<CR>
map <Leader>l6 :ll 6<CR>
map <Leader>l7 :ll 7<CR>
map <Leader>l8 :ll 8<CR>
map <Leader>l9 :ll 9<CR>
map <Leader>l0 :ll 10<CR>

" Other mappings for navigating the location list
map [l :lprev<CR>
map ]l :lnext<CR>
map [L :lfirst<CR>
map ]L :llast<CR>
map <Leader>ll :lopen<CR>
map <Leader>L :lclose<CR>

" }}}
" QUICKFIX LIST {{{

" <Leader>q<n> to switch to the nth location in the list
map <Leader>q1 :cc 1<CR>
map <Leader>q2 :cc 2<CR>
map <Leader>q3 :cc 3<CR>
map <Leader>q4 :cc 4<CR>
map <Leader>q5 :cc 5<CR>
map <Leader>q6 :cc 6<CR>
map <Leader>q7 :cc 7<CR>
map <Leader>q8 :cc 8<CR>
map <Leader>q9 :cc 9<CR>
map <Leader>q0 :cc 10<CR>

" Other mappings for navigating the location list
map [q :cprev<CR>
map ]q :cnext<CR>
map [Q :cfirst<CR>
map ]Q :clast<CR>
map <Leader>qq :copen<CR>
map <Leader>Q :cclose<CR>

" }}}
" TAB PAGES {{{

" NAVIGATING =================================================================

" <Leader><n> to switch to tab <n>
map <Leader>1 :tabn 1<CR>
map <Leader>2 :tabn 2<CR>
map <Leader>3 :tabn 3<CR>
map <Leader>4 :tabn 4<CR>
map <Leader>5 :tabn 5<CR>
map <Leader>6 :tabn 6<CR>
map <Leader>7 :tabn 7<CR>
map <Leader>8 :tabn 8<CR>
map <Leader>9 :tabn 9<CR>
map <Leader>0 :tabn 10<CR>

" Other mappings for navigating tabs
map <Leader><Leader> :tabedit<Space>
map [<Leader> :tabprevious<CR>
map ]<Leader> :tabnext<CR>
map [\| :tabfirst<CR>
map ]\| :tablast<CR>

" MOVING =====================================================================

" <Leader><S-<n>> to move current tab after <n>
map <Leader>) :tabmove 0<CR>
map <Leader>! :tabmove 1<CR>
map <Leader>@ :tabmove 2<CR>
map <Leader># :tabmove 3<CR>
map <Leader>$ :tabmove 4<CR>
map <Leader>% :tabmove 5<CR>
map <Leader>^ :tabmove 6<CR>
map <Leader>& :tabmove 7<CR>
map <Leader>* :tabmove 8<CR>
map <Leader>( :tabmove 9<CR>

" Other mappings for moving tabs
map <Leader>{ :tabmove -<CR>
map <Leader>} :tabmove +<CR>
map \|{ :tabmove 0<CR>
map \|} :tabmove $<CR>

" CLOSING ====================================================================

" <Leader><Backspace><n> to close tab <n> with confirmation
map <Leader><Backspace>1 :tabclose 1<CR>
map <Leader><Backspace>2 :tabclose 2<CR>
map <Leader><Backspace>3 :tabclose 3<CR>
map <Leader><Backspace>4 :tabclose 4<CR>
map <Leader><Backspace>5 :tabclose 5<CR>
map <Leader><Backspace>6 :tabclose 6<CR>
map <Leader><Backspace>7 :tabclose 7<CR>
map <Leader><Backspace>8 :tabclose 8<CR>
map <Leader><Backspace>9 :tabclose 9<CR>
map <Leader><Backspace>0 :tabclose 10<CR>

" Other mappings for closing tabs with confirmation
map <Leader><Backspace>[ :tabclose -<CR>
map <Leader><Backspace>] :tabclose +<CR>
map <Leader><Backspace><Leader> :tabclose<CR>

" <Leader><Backspace><S-<n>> to close tab <n> discarding unsaved changes
map <Leader><Backspace>! :tabclose! 1<CR>
map <Leader><Backspace>@ :tabclose! 2<CR>
map <Leader><Backspace># :tabclose! 3<CR>
map <Leader><Backspace>$ :tabclose! 4<CR>
map <Leader><Backspace>% :tabclose! 5<CR>
map <Leader><Backspace>^ :tabclose! 6<CR>
map <Leader><Backspace>& :tabclose! 7<CR>
map <Leader><Backspace>* :tabclose! 8<CR>
map <Leader><Backspace>( :tabclose! 9<CR>
map <Leader><Backspace>) :tabclose! 10<CR>

" Other mappings for closing tabs discarding unsaved changes
map <Leader><Backspace>{ :tabclose! -<CR>
map <Leader><Backspace>} :tabclose! +<CR>
map <Leader><Backspace>\| :tabclose!<CR>

" }}}

" PLUGINS --------------------------------------------------------------------

" VIM-PLUG {{{

" Installs vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Runs :PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
" Begin list of plugins ======================================================

" vim-plug itself for managing plugins
Plug 'junegunn/vim-plug'

" COC for completion and diagnostics
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" lightline for statusline and tabline
Plug 'itchyny/lightline.vim'

" NERDTree for file browsing
Plug 'preservim/nerdtree'

" undotree for browsing the undo tree
Plug 'mbbill/undotree'

" indentLine for displaying indent lines
Plug 'Yggdroot/indentLine'

" vim-commentary for manipulating comments
Plug 'tpope/vim-commentary'

" vim-surround for manipulating brackets, quotes, and tags
Plug 'tpope/vim-surround'

" vim-floaterm for floating terminals
Plug 'voldikss/vim-floaterm'

" vim-fugitive for git commands
Plug 'tpope/vim-fugitive'

" vim-gitgutter for viewing git status per line
Plug 'airblade/vim-gitgutter'

" vim-diffsave for viewing file diff against disk save"
Plug 'cterdam/vim-diffsave'

" gruvbox for colorscheme
Plug 'morhetz/gruvbox'

" goyo for focused writing
Plug 'junegunn/goyo.vim'

" End list of plugins ========================================================
call plug#end()
" According to specs (https://github.com/junegunn/vim-plug) This also
" automatically executes 'filetype plugin indent on' and 'syntax enable'.
" This script executed these separately on its own, nonetheless.

" Run :PlugUpdate every once in a while to update plugins
" To uninstall, remove from this list, then run :PlugClean

" TODO: Some things to consider in the future:
" - kien/ctrlp.vim or junegunn/fzf.vim for finding files
" - ggreer/the_silver_searcher or mileszs/ack.vim for grepping code
" - kana/vim-textobj-user for custom text objects
" - tpope/vim-obsession for saving/loading vim sessions
" - godlygeek/tabular for lining up text

" }}}
" COC {{{

" CONQUERER OF COMPLETION

" Extensions =================================================================

" COC will auto install any missing extensions in this list.
" See https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" Use :CocUpdate or :CocUpdateSync to update COC extensions
" To uninstall, remove from this list, then run :CocUninstall coc-css
let g:coc_global_extensions = [
    \'coc-calc',
    \'coc-clangd',
    \'coc-json',
    \'coc-pyright',
    \]

" coc-clangd requires a working copy of clangd in PATH.

" If coc-pyright doesn't work, try this:
" autocmd FileType python let b:coc_root_patterns = ['.venv']

" ============================================================================

" The following config are partially adapted from COC's sample config README:

" Completion =================================================================

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" It's unclear which description block this function belongs to.
" It seems to have no effect.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics ================================================================

" Remember to put this line in :CocConfig to view current line's error, no
" matter where the cursor is on the same line:
" \"diagnostic.checkCurrentLine": true

" Use <Leader>g to get all diagnostics of current buffer in location list
map <Leader>g :CocDiagnostics<CR>

" Use `[g` and `]g` to navigate diagnostics
" Alternatively it's also fine to use location list navigation keys directly
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" }}}
" NERDTREE {{{

" <Leader>t to recover and switch to an existing NERDTree window
nnoremap <Leader>t :NERDTreeFocus<CR>

" <Leader>T to close NERDTree
nnoremap <Leader>T :NERDTreeClose<CR>

" Confine NERDTree window to 25 chars wide
let g:NERDTreeWinSize = 25

" Hide guide text but still type '?' for help
let NERDTreeMinimalUI = 1

" Function to switch to existing tree or find current file in new tree window
" Currently, no binding for this function: NERDTreeFocus is already good enough
function! SummonNERDTree()
    if IsNERDTreeOpen()
        NERDTreeFocus
    else
        NERDTreeFind
    endif
endfunction

" Function to check if NERDTree is open
function! IsNERDTreeOpen()        
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Function to call NERDTreeFind iff NERDTree is active, current window contains
" a modifiable file, and we're not in vimdiff
" Currently not used either. To highlight currently open buffer in NERDTree,
" use `autocmd BufEnter * call SyncTree()`
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" }}}
" UNDOTREE {{{

" <Leader>u to toggle the undo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" 1 = side pane on left; 2 = tree on left diff in bottom
" 3 = side pane on right ; 4 = tree on right diff in bottom
let g:undotree_WindowLayout = 4

" Display s, m, h, d instead of seconds, minutes, hours, days
let g:undotree_ShortIndicators = 1

" Look at the stars, look how they shine for you
let g:undotree_TreeNodeShape = '*'

" Hide guide text but still type '?' for help
let g:undotree_HelpLine = 0

" Limit tree window to 25 chars wide 
let g:undotree_SplitWidth = 25

" Limit preview window to 10 chars high
let g:undotree_DiffpanelHeight = 10

" Auto open diff window
let g:undotree_DiffAutoOpen = 1

" Focus on tree window when opening
let g:undotree_SetFocusWhenToggle = 1

" }}}
" INDENTLINE {{{

" Use default grey for indent lines
let g:indentLine_setColors = 1

" If file encoding is not UTF-8, can change this to | instead
let g:indentLine_char = '¦'

" indentLine will override 'concealcursor' with this value
let g:indentLine_concealcursor = 'inc'

" indentLine will override 'conceallevel' with this value
" indentLine will not function if conceallevel is not set to 1 or 2
let g:indentLine_conceallevel = 2

" Enable indentLine
let g:indentLine_enabled = 1

" <Leader><Tab> to toggle displaying of indent lines
map <Leader><Tab> :IndentLinesToggle<CR>

" }}}
" VIM-FLOATERM {{{

" <F12> to toggle the floaterm
let g:floaterm_keymap_toggle = '<F12>'

" No title for floaterm
let g:floaterm_title = ''

" Float in the center
let g:floaterm_position = 'center'

" Always close floaterm upon job exit
let g:floaterm_autoclose = 2

" }}}
" VIM-GITGUTTER {{{

" Supply colors for GitGutter signs.
" These don't seem to get used, but removing them spawns another set of colors.
highlight GitGutterAdd    ctermbg=black ctermfg=green ctermfg=2
highlight GitGutterChange ctermbg=black ctermfg=yellow ctermfg=3
highlight GitGutterDelete ctermbg=black ctermfg=red ctermfg=1

" Turn off hunk highlighting on default
autocmd VimEnter * GitGutterLineHighlightsDisable

" <Leader>i to toggle hunk line highlighting
map <Leader>i :GitGutterLineHighlightsToggle<CR>

" Use location list and not quickfix for hunks
let g:gitgutter_use_location_list = 1

" <Leader>c to toggle change list (view/hide hunks)
function! ToggleHunks()
    if get(getloclist(0, {'winid':0}), 'winid', 0)
        :lclose
    else
        :GitGutterQuickFix
        :lopen
    endif
endfunction
map <Leader>c :call ToggleHunks()<CR>

" }}}
" LIGHTLINE {{{

" Successfully display the statusline
set laststatus=2

" Hide that default '-- INSERT --' as that info is covered by lightline
set noshowmode

" Define fields of the statusline and tabline.
" For more available fields, See :help lightline,
" and more specifically :help g:lightline.component
let g:lightline= {
    \ 'active': {
        \ 'left': [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'filename', 'modified'],
        \           [ 'gitbranch', 'gitstatus' ] ],
        \ 'right': [ [ 'percent', 'lineinfo'],
        \            [ 'filetype' ],
        \            [ 'statusdiagnostic' ] ] },
    \ 'inactive':{
        \ 'left': [ [ 'readonly', 'absolutepath', 'modified' ] ],
        \ 'right': [ [ 'lineinfo' ],
        \            [ 'percent' ] ] },
    \ 'tabline': {
        \ 'left': [ [ 'tabs' ] ],
        \ 'right': [] },
    \ 'component_function': {
        \ 'gitbranch': 'FugitiveHead',
        \ 'gitstatus': 'GitStatus',
        \ 'statusdiagnostic': 'StatusDiagnostic'}
\ }

" Function to format current file git info
" This requires vim-gitgutter and vim-fugitive
function! GitStatus()
    if FugitiveHead() == ''
        return ''
    else
        let [a,m,r] = GitGutterGetHunkSummary()
        return printf('+%d ~%d -%d', a, m, r)
    endif
endfunction

" Function to get formatted status diagnostic from COC
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    
    " Display the number of errors even if it's 0
    call add(msgs, '!' . info['error'])
    " if get(info, 'error', 0)
    "     call add(msgs, '!' . info['error'])
    " endif
    
    " Display the number of warnings even if it's 0
    call add(msgs, '?' . info['warning'])
    " if get(info, 'warning', 0)
    "     call add(msgs, '?' . info['warning'])
    " endif

    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

" }}}
" VIM-DIFFSAVE {{{

" <Leader>w to toggle the diffsave window
map <Leader>w <Plug>ToggleDiffSave<CR>

" }}}
" GRUVBOX {{{

" Activate the gruvbox colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

" The gruvbox wiki recommends the following settings to get single cursor
" color while searching, so it's easier to locate the cursor. However, no
" difference was observed.

" nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
" nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
" nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

" nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
" nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
" nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" }}}
" GOYO {{{

" <Leader>o to toggle goyo
map <Leader>o :Goyo<CR>

" Set goyo width
let g:goyo_width = 80

" Set goyo height
let g:goyo_height = 45

" No line numbers in goyo
let g:goyo_linenr = 0

" This function will be executed when entering goyo
function! s:goyo_enter()
    set showmode
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

" This function will be executed when leaving goyo
function! s:goyo_leave()
    set noshowmode
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

" Bind enter and leave functions to goyo command
autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" }}}
