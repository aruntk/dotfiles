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

"search
Plug 'kien/ctrlp.vim'
"Plug 'wincent/command-t'

"moving cursor
" Plug 'easymotion/vim-easymotion'

"align paragraphs
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'
"visually displaying indent levels
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'

"Todo List
Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
Plug 'jceb/vim-orgmode', { 'for': ['markdown'] }

"syntax checking plugin
Plug 'neomake/neomake', Cond(has('nvim'), { 'on': 'Neomake' })
" Plug 'scrooloose/syntastic', Cond(has('vim'))
Plug 'scrooloose/syntastic'
" Plug 'sindresorhus/vim-xo'
Plug 'Chiel92/vim-autoformat'
" Plug 'tpope/vim-unimpaired'

"Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
"Plug 'maksimr/vim-jsbeautify'
"Plug 'einars/js-beautify'
" Plug 'groenewege/vim-less'
" Plug 'ap/vim-css-color'
Plug 'isRuslan/vim-es6'
Plug 'scrooloose/nerdcommenter'
"react jsx syntax
Plug 'mxw/vim-jsx'
"react styled jsx <style jsx>
Plug 'alampros/vim-styled-jsx'
" Plug 'webdesus/polymer-ide.vim', { 'for': 'html' }
Plug 'tomlion/vim-solidity', { 'for': ['solidity'] }
"graphql
" Plug 'jparise/vim-graphql'

" js auto complete
"Plug 'ternjs/tern_for_vim'
"meteor auto complete
" Plug 'Slava/tern-meteor'
"autocomplete
"Plug 'valloric/youcompleteme'
"Plug 'Shougo/neocomplete'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

Plug 'Townk/vim-autoclose'
" surround something
" Plug 'tpope/vim-surround'
"closes tags while typing
"Plug 'alvan/vim-closetag'
"closes open tags on ctrl+_ shortcut
Plug 'docunext/closetag.vim'

"extended % matching
" Plug 'matchit.zip'
"repeating . for plugins
" Plug 'tpope/vim-repeat'

" Case operations
Plug 'tpope/vim-abolish'

Plug 'altercation/vim-colors-solarized'

"Plug 'Shougo/vimshell.vim'
"Plug 'Shougo/vimproc.vim'

"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'christoomey/vim-tmux-navigator'
"Session management
Plug 'tpope/vim-obsession'

" The following are examples of different formats supported.
" Keep Plug commands between plugbegin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" git diff in the gutter
Plug 'airblade/vim-gitgutter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'
" Git plugin not hosted on GitHub
" Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plug 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plug 'user/L9', {'name': 'newL9'}

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
"NerdCommenter {{{
let NERDSpaceDelims=1
"}}}
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
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
" }}}

" Neomake {{{
if has('nvim')
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake
autocmd BufWinEnter quickfix nnoremap <silent> <buffer>
      \   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
      \   bd|
      \   q | endif
" to open qf
" let g:neomake_open_list = 2
" to highlight lines
" let g:neomake_highlight_lines = 1
" let g:neomake_list_height = 2

" move to next error
nmap <Leader>] :lnext<CR>
" move to previous error.
nmap <Leader>[ :lprev<CR>

let g:neomake_warning_sign = {
  \ 'text': '?',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': '✗',
  \ 'texthl': 'WarningMsg',
  \ }
endif
" }}}
if has('vim')
" Syntastic.vim {{{
augroup syntastic_config
autocmd!

  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 1
  let g:syntastic_mode_map = { "mode": "passive" }
  " let g:syntastic_javascript_xo_args="--space"
  let g:syntastic_javascript_checkers = ['eslint']
  map <C-f> :SyntasticCheck<cr>
  let syntastic_mode_map = { 'passive_filetypes': ['html'] }

  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
  "map <c-f> :Esformatter<cr>
  autocmd FileType javascript noremap <buffer>  <c-f> :Esformatter<cr>
  nmap <Leader>] :lnext<CR>
  nmap <Leader>[ :lprev<CR>
augroup END
" }}}
endif
"
" autoformat {{{
" let g:formatdef_xo = '"xo --fix --stdin"'
" let g:formatters_javascript = ['xo']
"}}}
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
au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr
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
