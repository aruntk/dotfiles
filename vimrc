"Defaults {{{

set nocompatible              " be iMproved, required
filetype off                  " required

"}}}

" Load plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

"search
Plugin 'kien/ctrlp.vim'
"Plugin 'wincent/command-t'

"moving cursor
Plugin 'easymotion/vim-easymotion'

"align paragraphs
Plugin 'junegunn/vim-easy-align'
"Plugin 'godlygeek/tabular'
"visually displaying indent levels
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

"Todo List
Plugin 'plasticboy/vim-markdown'
Plugin 'jceb/vim-orgmode'

"syntax checking plugin
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'

"Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'einars/js-beautify'
Plugin 'groenewege/vim-less'
Plugin 'ap/vim-css-color'
Plugin 'isRuslan/vim-es6'
Plugin 'scrooloose/nerdcommenter'
"react jsx syntax
Plugin 'mxw/vim-jsx'
"graphql
Plugin 'jparise/vim-graphql'

" js auto complete
"Plugin 'ternjs/tern_for_vim'
"meteor auto complete
Plugin 'Slava/tern-meteor'
"autocomplete
"Plugin 'valloric/youcompleteme'
"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

Plugin 'Townk/vim-autoclose'
" surround something
Plugin 'tpope/vim-surround'
"closes tags while typing
"Plugin 'alvan/vim-closetag'
"closes open tags on ctrl+_ shortcut
Plugin 'docunext/closetag.vim'

"extended % matching
Plugin 'matchit.zip'
"repeating . for plugins
Plugin 'tpope/vim-repeat'

Plugin 'altercation/vim-colors-solarized'

"Plugin 'Shougo/vimshell.vim'
"Plugin 'Shougo/vimproc.vim'

"Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'christoomey/vim-tmux-navigator'
"Session management
Plugin 'tpope/vim-obsession'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
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
set clipboard=unnamed
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
" set the runtime path to include Vundle and initialize
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
set hidden

set t_Co=256
syntax enable " Enable syntax highlighting
set background=dark " Set dark background
colorscheme solarized " Set color scheme
set nu " Enable line numbers
set backspace=indent,eol,start
set cursorline "highlight currentline
hi Normal ctermbg=none
set wildignore+=.DS_Store
" Highlight searches
set hlsearch
" Ignore case of searches
"set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" }}}

" Leader {{{
let mapleader = ","
"}}}


"NerdTree  {{{
" My NerdTree shortcut
map <C-n> :NERDTreeToggle<CR>
"let NerdTreeDirArrows=0 "tree arrows disabled

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.sw']
" }}}
"
" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}
"}}}


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

  " Allow us to use Ctrl-s and Ctrl-q as keybinds {{{
  silent !stty -ixon
  " Keymaps for saving using ctrl+s
  noremap <silent> <C-S> :update<CR>
  vnoremap <silent> <C-S> <C-C>:update<CR>
  inoremap <silent> <C-S> <C-O>:update<CR><C-C>

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


  " Tab movements
  nnoremap <leader>m :tabn<CR>
  nnoremap <leader>n :tabp<CR>

  " For listing buffers
  nnoremap <leader>b :buffers<CR>

  "}}}

  " space open/closes folds
  "set foldmethod=indent
  "nnoremap <space> za
  " <Enter> for newline without entering insert-mode
  "


  " Switch File Type

  map <leader>s :execute "set syntax=htmlm4"<CR>

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

  "Indentation {{{
  " by default, the indent is 2 spaces. 
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  "Indentation for WebDevelopment
  autocmd FileType javascript,html,css,php set ai
  autocmd FileType javascript,html,css,php set sw=2
  autocmd FileType javascript,html,css,php set ts=2
  autocmd FileType javascript,html,css,php set sts=2
  "autocmd FileType javascript,css,php set textwidth=79
  "}}}

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



augroup END
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

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
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
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}

"=============== Plugins ===========

" Indent Guide {{{
"hi IndentGuidesOdd  ctermbg=black
"hi IndentGuidesEven ctermbg=darkgrey
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

" EasyAlign.vim {{{
augroup easy_align_config
  autocmd!
  vmap <Enter> <Plug>(EasyAlign) 
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  nmap <Leader>a <Plug>(EasyAlign) 
  " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
augroup END
" }}}

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" Syntastic.vim {{{
augroup syntastic_config
  autocmd!

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_javascript_checkers = ['jshint']
  let syntastic_mode_map = { 'passive_filetypes': ['html'] }

  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  nmap <Leader>,] :lnext<C-R>
  nmap <Leader>,[ :lprev<C-R>
augroup END
" }}}

"youcompleteme {{{
"let g:spf13_no_omni_complete = 1
" }}}

" My PowerLine Configs {{{

"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
"set laststatus=2
"let g:Powerline_symbols = 'fancy'
"set fillchars+=stl:\ ,stlnc:\

" }}}

"Close Tag {{{
"# filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
" }}}


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
au BufEnter *.md setlocal foldexpr=MarkdownLevel()  
au BufEnter *.md setlocal foldmethod=expr 
nmap <CR> o<Esc>
nmap <leader>/ ,c 
vmap <leader>/ ,c 
"}}}


