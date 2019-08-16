"Defaults {{{

set nocompatible              " be iMproved, required
filetype off                  " required

"}}}

" Load plugins {{{

" Plug conditions {{{
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
"}}}
call plug#begin('~/.local/share/nvim/plugged')
"alternatively, pass a path where Vundle should install plugins

"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plug 'VundleVim/Vundle.vim'

Plug 'scrooloose/nerdtree'
"Plug 'bagrat/vim-workspace'
"Plug 'tpope/vim-vinegar'
Plug 'Xuyuanp/nerdtree-git-plugin'

"search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
"Plug 'othree/eregex.vim'
"Plug 'dkprice/vim-easygrep'
Plug 'haya14busa/incsearch.vim'

"align paragraphs
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'

"Todo List

"syntax checking plugin
Plug 'w0rp/ale'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
"Plug 'valloric/youcompleteme'
"snippets
Plug 'honza/vim-snippets'

"run code
" Plug 'thinca/vim-quickrun'
"
"undo tree
Plug 'sjl/gundo.vim'

"colorize rgb
Plug 'lilydjwg/colorizer'
"Syntax
"Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
" Plug 'isRuslan/vim-es6'
Plug 'herringtondarkholme/yats.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'tasn/vim-tsx'
"Plug 'mhartington/nvim-typescript', {'do': 'sh install.sh'}
"Plug 'leafgarland/typescript-vim', {'for': ['typescript', 'typescriptreact']}
"Plug 'mxw/vim-jsx'
"Plug 'ianks/vim-tsx', { 'for': 'typescriptreact' }
"Plug 'jason0x43/vim-js-indent'

Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'gcmt/wildfire.vim'
"closes open tags on ctrl+_ shortcut
Plug 'docunext/closetag.vim'
Plug 'tpope/vim-unimpaired'
"show marks
Plug 'majutsushi/tagbar'

Plug 'mhinz/vim-startify'


" Case operations
Plug 'tpope/vim-abolish'

"repeat
Plug 'tpope/vim-repeat'

"status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

Plug 'christoomey/vim-tmux-navigator'
"Session management
Plug 'tpope/vim-obsession'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" git diff in the gutter
Plug 'airblade/vim-gitgutter'

"color schemes
"Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'joshdick/onedark.vim'
"glyph
Plug 'ryanoasis/vim-devicons'
" All of your Plugins must be added before the following line
call plug#end() "required
"  }}}

"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Defaults + Colors and stuff {{{
set clipboard=unnamedplus
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
set hidden

set t_Co=256
set encoding=utf8
syntax enable " Enable syntax highlighting
set nu " Enable line numbers
set backspace=indent,eol,start
set cursorline "highlight currentline
hi Normal ctermbg=none
set t_ZH=^[[3m
set t_ZR=^[[23m
highlight Comment cterm=italic
set wildignore+=.DS_Store

" Color Theme
" If it's beyond dusk, I use dark theme.
" Other wise, a lighter theme will be chosen.
let cur_hour = str2nr(strftime("%H", localtime()))
if cur_hour > 18 || cur_hour < 8
  colorscheme dracula " Set color scheme
  set background=dark " Set dark background
  "let g:evervim_airline_theme="dracula"
else
  colorscheme dracula " Set color scheme
  "let g:evervim_airline_theme="dracula"
  set background=dark " Set dark background
endif


" Highlight searches
"set hlsearch
" Ignore case of searches
"set ignorecase
" Highlight dynamically as pattern is typed
"set incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" Leader {{{
let mapleader = ","
"}}}


"NerdTree  {{{
" My NerdTree shortcut
map <C-n> :NERDTreeToggle<CR>
"let NERDTreeHijackNetrw=1
"let NerdTreeDirArrows=0 "tree arrows disabled

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.sw']
" }}}
"
"NerdCommenter {{{
" let NERDSpaceDelims=1
"}}}
"
"Workspace {{{
"noremap <Tab> :WSNext<CR>
"noremap <S-Tab> :WSPrev<CR>
"noremap <Leader><Tab> :WSClose<CR>
"noremap <Leader><S-Tab> :WSClose!<CR>
"noremap <C-t> :WSTabNew<CR>

"cabbrev bonly WSBufOnly
"let g:workspace_powerline_separators = 1
"let g:workspace_tab_icon = "\uf00a"
"let g:workspace_left_trunc_icon = "\uf0a8"
"let g:workspace_right_trunc_icon = "\uf0a9"
"}}}
"
"Netrw {{{
let g:netrw_liststyle=3
let g:netrw_altv = 1
"}}}
"
"
" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}
"}}}


" Ignore {{{
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
" }}}
"
" Hard to type things {{{
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
iabbrev aa λ
" }}}
"
" General {{{
augroup general_config
  autocmd!

  " tilde case modification {{{
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  "}}}

  " Other{{{
  let g:vimshell_prompt =  '$ '
  " open new splits actually in new tab
  let g:vimshell_split_command = "tabnew"

  if has("gui_running")
    let g:vimshell_editor_command = "mvim"
  endif

  augroup vimrc_autocmds
    autocmd BufEnter * highlight OverLength ctermbg=DarkGray guibg=#592929
    autocmd BufEnter * match OverLength /\%79v./
  augroup END
  "}}}

  " EVIL MODE {{{
  " noremap <Up> <NOP>
  " noremap <Down> <NOP>
  " noremap <Left> <NOP>
  " noremap <Right> <NOP>

  " inoremap <Up> <NOP>
  " inoremap <Down> <NOP>
  " inoremap <Left> <NOP>
  " inoremap <Right> <NOP>
  " }}}

  " Allow us to use Ctrl-s and Ctrl-q as keybinds {{{
  silent !stty -ixon
  " Keymaps for saving using ctrl+s
  noremap <silent> <C-S> :update<CR>
  vnoremap <silent> <C-S> <C-C>:update<CR>
  inoremap <silent> <C-S> <C-O>:update<CR><C-C>

  " No need for ex mode
  nnoremap Q <nop>
  "}}}

  "replace selected text in visual mode {{{
  vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
  "}}}

  "autocomplete path {{{
  imap <S-Tab> <C-X><C-F>
  "}}}

  " Splits tweaks {{{
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  "}}}

  " copy and paste {{{
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <ESC>"+pa
  "}}}

  " Other leader based {{{
  nnoremap <leader>p :CtrlPBuffer<CR>
  vnoremap <leader>p :CtrlPBuffer<CR>

  " Clear last search (,qs) {{{
  map <silent> <leader>qs <Esc>:noh<CR>
  " map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Tab movements
  " nnoremap <leader>m :tabn<CR>
  " nnoremap <leader>n :tabp<CR>

  " For listing buffers
  nnoremap <leader>b :buffers<CR>

  "}}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}
  "
  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}
  "
  " tagbar map {{{
  nmap <F8> :TagbarToggle<CR>
  " Set default width
  let g:tagbar_width = 30
  " Typescript Tags
  let g:tagbar_type_typescript = {
        \ 'ctagsbin' : 'tstags',
        \ 'ctagsargs' : '-f-',
        \ 'kinds': [
        \ 'e:enums:0:1',
        \ 'f:function:0:1',
        \ 't:typealias:0:1',
        \ 'M:Module:0:1',
        \ 'I:import:0:1',
        \ 'i:interface:0:1',
        \ 'C:class:0:1',
        \ 'm:method:0:1',
        \ 'p:property:0:1',
        \ 'v:variable:0:1',
        \ 'c:const:0:1',
        \ ],
        \ 'sort' : 0
        \ }
  " }}}
  "
  " Highlight Interesting Words {{{
  augroup highlight_interesting_word
    autocmd!
    " This mini-plugin provides a few mappings for highlighting words temporarily.
    "
    " Sometimes you're looking at a hairy piece of code and would like a certain
    " word or two to stand out temporarily.  You can search for it, but that only
    " gives you one color of highlighting.  Now you can use <leader>N where N is
    " a number from 1-6 to highlight the current word in a specific color.
    function! HiInterestingWord(n) " {{{
      " Save our location.
      normal! mz

      " Yank the current word into the z register.
      normal! "zyiw

      " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
      let mid = 86750 + a:n

      " Clear existing matches, but don't worry if they don't exist.
      silent! call matchdelete(mid)

      " Construct a literal pattern that has to match at boundaries.
      let pat = '\V\<' . escape(@z, '\') . '\>'

      " Actually match the words.
      call matchadd("InterestingWord" . a:n, pat, 1, mid)

      " Move back to our original location.
      normal! `z
    endfunction " }}}

    " Mappings {{{
    nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
    nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
    nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
    nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
    nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
    nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
    " }}}

    " Default Highlights {{{
    hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
    hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
    hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
    hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
    hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
    hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
    " }}}
  augroup END
  " }}}

  " Restore Cursor Position {{{
  augroup restore_cursor
    autocmd!

    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END
  " }}}
  " space open/closes folds
  "set foldmethod=indent
  "nnoremap <space> za
  " <Enter> for newline without entering insert-mode
  "
  " set foldmethod=syntax
  " set foldlevelstart=1


  "Set html files syntax as htmlm4
  "au BufRead *.html set syntax=htmlm4

  " For showing tabs,newlines,trailing-white-spaces,etc. {{{
  set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
  set list
  "}}}

  " Number toggle {{{
  function! NumberToggle()
    if(&rnu == 1)
      set rnu!
    else
      set rnu
    endif
  endfunc

  nnoremap <leader>l :call NumberToggle()<cr>

  "}}}
  "{{{ menu settings
  "
  inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
        \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
        \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
  "}}}
  "{{{ ale config syntax checking and fixing

  let g:ale_fix_on_save = 0
  " let g:ale_completion_enabled = 0
  " let g:ale_linter_aliases = {'tsx': 'css'}
  let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '?'
  let g:ale_warn_about_trailing_whitespace = 0
  let g:ale_maximum_file_size = 1024 * 1024
  let g:ale_completion_enabled = 1
  let g:ale_linters = {
        \   'html': [],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint', 'tsserver'],
        \   'typescript.tsx': ['tslint', 'tsserver'],
        \   'python': ['flake8'],
        \}

  let g:ale_pattern_options_enabled = 1
  let g:ale_pattern_options = {
        \   'python-to-typescript/python_to_typescript/.*$': {
        \       'ale_linters': {'python': ['flake8', 'pylint']},
        \   },
        \   'site-packages/.*$': {
        \       'ale_enabled': 0,
        \       '&modifiable': 0,
        \   },
        \   '\.pyi$': {
        \       'ale_linters': ['mypy'],
        \   },
        \   '\v\.min\.(js|css)$': {
        \       'ale_linters': [],
        \       'ale_fixers': [],
        \   },
        \   'node_modules': {
        \       'ale_fixers': [],
        \   },
        \   '/python-ls-project/': {
        \       'ale_linters': {'python': ['pyls', 'flake8']},
        \   },
        \}
  " Options for different linters.
  let g:ale_python_mypy_ignore_parse_errors = 1
  let g:ale_python_mypy_options = '--incremental'
  let g:ale_typescript_tslint_ignore_empty_files = 1
  "let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_insert_leave = 1

  nnoremap <leader>] :lnext<CR>
  nnoremap <leader>[ :lprevious<CR>
  " disable space = cursor movement
  "nnoremap <space> <Nop>
  "vnoremap <space> <Nop>
  "nnoremap <leader>{ :lrewind<CR>
  nnoremap <leader>d :ALEGoToDefinition<CR>
  nnoremap <leader>F :ALEFix<CR>
  nnoremap <leader>f :ALEDetail<CR>
  vnoremap <leader>d :ALEGoToDefinition<CR>
  vnoremap <leader>F :ALEFix<CR>
  vnoremap <leader>f :ALEDetail<CR>
  "}}}
  "
  "{{{ typescript tsx autocomplete
  " set filetypes as typescript.jsx
  "autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx
  " autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
  " colors
  " light blues
  " hi xmlTagName guifg=#59ACE5
  " hi xmlTag guifg=#59ACE5

  " dark blues
  " hi xmlEndTag guifg=#2974a1
  "}}}

  "Indentation {{{
  " by default, the indent is 2 spaces.
  " --------------------------------------------------------------------------------
  " configure editor with tabs and nice stuff...
  " --------------------------------------------------------------------------------
  set expandtab           " enter spaces when tab is pressed
  set textwidth=120       " break lines when line length increases
  set tabstop=4           " use 4 spaces to represent tab
  set softtabstop=4
  set shiftwidth=4        " number of spaces to use for auto indent
  set autoindent          " copy indent from current line when starting a new line

  " configure expanding of tabs for various file types
  au BufRead,BufNewFile *.py set expandtab
  au BufRead,BufNewFile *.c set noexpandtab
  au BufRead,BufNewFile *.h set noexpandtab
  au BufRead,BufNewFile Makefile* set noexpandtab


  " make backspaces more powerfull
  set backspace=indent,eol,start

  set ruler                           " show line and column number
  syntax on               " syntax highlighting
  set showcmd             " show (partial) command in status line


  "Indentation for WebDevelopment
  autocmd FileType tsx,jsx,tsx,typescript,typescript.tsx,javascript,html,css,php set ai
  autocmd FileType tsx,jsx,tsx,typescript,typescript.tsx,javascript,html,css,php set sw=2
  autocmd FileType tsx,jsx,tsx,typescript,typescript.tsx,javascript,html,css,php set ts=2
  autocmd FileType tsx,jsx,tsx,typescript,typescript.tsx,javascript,html,css,php set sts=2

  "let g:neoformat_enabled_typescript = ['prettier']
  " disable typescript indentation
  "let g:typescript_indent_disable = 1
  "autocmd FileType javascript,css,php set textwidth=79
  "}}}
  " deoplete autocomplete
  "let g:deoplete#enable_at_startup = 1
  "let g:deoplete#num_processes = 1

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}
  " }}}
  " Buffers {{{
  augroup buffer_control
    autocmd!

    " Prompt for buffer to select (,bs) {{{
    nnoremap <leader>bs :CtrlPBuffer<CR>
    " }}}

    " Buffer navigation (,,) (gb) (gB) (,ls) {{{
    map <Leader>, <C-^>
    map <Leader>ls :buffers<CR>
    map gb :bnext<CR>
    map gB :bprev<CR>
    " }}}

    " Jump to buffer number (<N>gb) {{{
    let c = 1
    while c <= 99
      execute "nnoremap " . c . "gb :" . c . "b\<CR>"
      let c += 1
    endwhile
    " }}}

    " Close Quickfix window (,qq) {{{
    map <leader>qq :cclose<CR>
    " }}}
  augroup END
  " }}}


  "============== File Types ============

  " JavaScript {{{
  augroup filetype_javascript
    autocmd!
    let g:javascript_conceal = 1
  augroup END
  " }}}

  " JSON {{{
  augroup filetype_json
    autocmd!
    au BufRead,BufNewFile *.json set ft=json syntax=javascript
  augroup END
  " }}}

  " Markdown {{{
  augroup filetype_markdown
    autocmd!
    let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh', 'typescript', 'typescript.tsx']
  augroup END
  " }}}

  " Indent Guide {{{
  "hi IndentGuidesOdd  ctermbg=black
  "hi IndentGuidesEven ctermbg=darkgrey
  " }}}

  " React settings {{{
  let g:jsx_ext_required = 0
  " }}}

  " CtrlP.vim {{{
  augroup ctrlp_config
    autocmd!
    let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
    let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
    "let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
    let g:ctrlp_match_window_bottom = 0 " Show at top of window
    let g:ctrlp_max_files = 0 " Set no file limit, we are building a big project
    let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
    let g:ctrlp_open_new_file = 'r' " Open newly created files in the current window
    let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
  augroup END
  " }}}
  "
  "ack config {{{
  let g:ackprg = 'ag --nogroup --nocolor --column'
  "}}}

  " EasyAlign.vim {{{
  " augroup easy_align_config
  " autocmd!
  " vmap <Enter> <Plug>(EasyAlign)
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  " nmap <Leader>a <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
  " augroup END
  " }}}

  " Airline.vim {{{
  augroup airline_config
    autocmd!
    let g:airline_powerline_fonts = 1
    " let g:airline_enable_syntastic = 1
    let g:airline#extensions#tabline#buffer_nr_format = '%s '
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamecollapse = 0
    let g:airline#extensions#tabline#fnamemod = ':t'
  augroup END
  " }}}


  "  tmuxline config  {{{
  let g:tmuxline_theme = 'airline_insert'
  let g:tmuxline_preset = {
        \ 'a': '#S',
        \ 'b': '#F',
        \ 'c': '#W',
        \ 'win': ['#I', '#W'],
        \ 'cwin': ['#I', '#W'],
        \ 'x': '%a',
        \ 'y': ['%b %d', '%R'],
        \ 'z': '#h'}

  "}}}
  "  promptline config  {{{
  let g:promptline_theme = 'airline'
  let g:promptline_preset = {
        \'a': [ promptline#slices#python_virtualenv() ],
        \'b': [ promptline#slices#cwd({'dir_limit': 2}) ],
        \'c': [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)' ],
        \'x': [ promptline#slices#git_status() ],
        \'warn': [ promptline#slices#last_exit_code() ]}
  "}}}

  "Close Tag {{{
  "# filenames like *.xml, *.html, *.xhtml, ...
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
  " }}}

  "wildfire config {{{
  " This selects the next closest text object.
  map <SPACE> <Plug>(wildfire-fuel)

  " This selects the previous closest text object.
  vmap <C-SPACE> <Plug>(wildfire-water)
  "}}}

  func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
  endfunc
  noremap <leader>w :call DeleteTrailingWS()<CR>

  " MarkDown config {{{
  function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
      return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
      return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
      return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
      return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
      return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
      return ">6"
    endif
    return "="
  endfunction
  " au BufEnter *.md setlocal foldexpr=MarkdownLevel()
  " au BufEnter *.md setlocal foldmethod=expr
  function! NewlineEnter()
    if &buftype ==# 'quickfix'
      execute "normal! \<CR>"
    else
      normal! o
    endif
  endfunction
  " enter to new line if not in quickfix window
  nnoremap <CR> :call NewlineEnter()<CR>
  nmap <leader>/ ,c
  vmap <leader>/ ,c
  "}}}
  "
  "{{{
  " BufOnly.vim  -  Delete all the buffers except the current/named buffer.
  "
  " :Bonly / :BOnly / :Bufonly / :BufOnly [buffer]
  "
  " Without any arguments the current buffer is kept.  With an argument the
  " buffer name/number supplied is kept.

  command! -nargs=? -complete=buffer -bang Bonly
        \ :call BufOnly('<args>', '<bang>')
  command! -nargs=? -complete=buffer -bang BOnly
        \ :call BufOnly('<args>', '<bang>')
  command! -nargs=? -complete=buffer -bang Bufonly
        \ :call BufOnly('<args>', '<bang>')
  command! -nargs=? -complete=buffer -bang BufOnly
        \ :call BufOnly('<args>', '<bang>')

  function! BufOnly(buffer, bang)
    if a:buffer == ''
      " No buffer provided, use the current buffer.
      let buffer = bufnr('%')
    elseif (a:buffer + 0) > 0
      " A buffer number was provided.
      let buffer = bufnr(a:buffer + 0)
    else
      " A buffer name was provided.
      let buffer = bufnr(a:buffer)
    endif

    if buffer == -1
      echohl ErrorMsg
      echomsg "No matching buffer for" a:buffer
      echohl None
      return
    endif

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
      if n != buffer && buflisted(n)
        if a:bang == '' && getbufvar(n, '&modified')
          echohl ErrorMsg
          echomsg 'No write since last change for buffer'
                \ n '(add ! to override)'
          echohl None
        else
          silent exe 'bdel' . a:bang . ' ' . n
          if ! buflisted(n)
            let delete_count = delete_count+1
          endif
        endif
      endif
      let n = n+1
    endwhile

    if delete_count == 1
      echomsg delete_count "buffer deleted"
    elseif delete_count > 1
      echomsg delete_count "buffers deleted"
    endif

  endfunction
  "}}}
