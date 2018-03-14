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
" Plug 'kien/ctrlp.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
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
" Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }
" Plug 'jceb/vim-orgmode', { 'for': ['markdown'] }

"syntax checking plugin
Plug 'w0rp/ale'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
  " Plug 'Shougo/deoplete.nvim'
  " Plug 'roxma/nvim-yarp'
  " Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'valloric/youcompleteme'
"snippets
Plug 'honza/vim-snippets'
"Plug 'Shougo/neocomplete'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'


"Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
" Plug 'quramy/tsuquyomi'
Plug 'herringtondarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'sbdchd/neoformat'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'maxmellon/vim-jsx-pretty'
" Plug 'ianks/vim-tsx'
Plug 'tasn/vim-tsx'
" Plug 'Quramy/vim-js-pretty-template'
" Plug 'jason0x43/vim-js-indent'
" Plug 'maksimr/vim-jsbeautify'
"Plug 'einars/js-beautify'
" Plug 'groenewege/vim-less'
" Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdcommenter'
"react jsx syntax
" Plug 'mxw/vim-jsx'
"react styled jsx <style jsx>
" Plug 'alampros/vim-styled-jsx'
" Plug 'styled-components/vim-styled-components', { 'for': ['jsx', 'tsx'] }
" Plug 'webdesus/polymer-ide.vim', { 'for': 'html' }
" Plug 'tomlion/vim-solidity', { 'for': ['solidity'] }
"graphql
" Plug 'jparise/vim-graphql'

" Plug 'Townk/vim-autoclose'
" surround something
Plug 'tpope/vim-surround'
"closes tags while typing
Plug 'raimondi/delimitmate'
" Plug 'tpope/vim-ragtag'
" Plug 'alvan/vim-closetag'
"closes open tags on ctrl+_ shortcut
Plug 'docunext/closetag.vim'
Plug 'tpope/vim-unimpaired'
"show marks
Plug 'majutsushi/tagbar'

"multiple cursors
" Plug 'terryma/vim-multiple-cursors'

"expand abbreviations
" Plug 'mattn/emmet-vim'

"extended % matching
" Plug 'matchit.zip'
"repeating . for plugins
" Plug 'tpope/vim-repeat'

" Case operations
Plug 'tpope/vim-abolish'

Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'justinmk/molokai'
" Plug 'flazz/vim-colorschemes'

"Plug 'Shougo/vimshell.vim'

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
" colorscheme molokai " Set color scheme
" let g:molokai_original = 1
" let g:rehash256 = 1
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

" Word Processor Mode {{{
" augroup word_processor_mode
  " autocmd!

  " function! WordProcessorMode() " {{{
    " setlocal formatoptions=t1
    " map j gj
    " map k gk
    " setlocal smartindent
    " setlocal spell spelllang=en_ca
    " setlocal noexpandtab
    " setlocal wrap
    " setlocal linebreak
    " Goyo 100
  " endfunction " }}}
  " com! WP call WordProcessorMode()
" augroup END
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
  "
  "{{{ ale config syntax checking and fixing
  let g:ale_linters = {}
  let g:ale_linters['typescript.tsx'] = ['tslint']
  let g:ale_linters['typescript'] = ['tslint']
  let g:ale_fixers = {}
  let g:ale_fixers['typescript'] = ['tslint']
  let g:ale_fixers['typescript.tsx'] = ['tslint']
  let g:ale_fix_on_save = 0
  " let g:ale_completion_enabled = 0
  " let g:ale_linter_aliases = {'tsx': 'css'}

  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '?'

  nnoremap <leader>] :lnext<CR>
  nnoremap <leader>[ :lprevious<CR>
  " disable space = cursor movement
  nnoremap <space> <Nop>
  vnoremap <space> <Nop>
  nnoremap <space>[ :lrewind<CR>
  nnoremap <space>d :ALEGoToDefinition<CR>
  nnoremap <space>F :ALEFix<CR>
  nnoremap <space>f :ALEDetail<CR>
  vnoremap <space>d :ALEGoToDefinition<CR>
  vnoremap <space>F :ALEFix<CR>
  vnoremap <space>f :ALEDetail<CR>
  "}}}
  "
  "
  "{{{ typescript tsx autocomplete
  " set filetypes as typescript.jsx
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
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
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  "Indentation for WebDevelopment
  autocmd FileType jsx,typescript,javascript,html,css,php set ai
  autocmd FileType jsx,typescript,javascript,html,css,php set sw=2
  autocmd FileType jsx,typescript,javascript,html,css,php set ts=2
  autocmd FileType jsx,typescript,javascript,html,css,php set sts=2
  let g:neoformat_enabled_typescript = ['prettier']
  " disable typescript indentation
  " let g:typescript_indent_disable = 1
  "autocmd FileType javascript,css,php set textwidth=79
  "}}}
  " deoplete autocomplete
  " let g:deoplete#enable_at_startup = 1

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
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh', 'typescript']
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
  " let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
augroup END
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
