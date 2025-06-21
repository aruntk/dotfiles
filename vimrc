"Defaults {{{

set nocompatible              " be iMproved, required
filetype off                  " required

"}}}

" Auto-install vim-plug if not found {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}

" Load plugins {{{

" Plug conditions {{{
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
"}}}
call plug#begin('~/.local/share/nvim/plugged')

" File navigation and management
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'

" Search and navigation
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'BurntSushi/ripgrep'
" Plug 'haya14busa/incsearch.vim'

" LSP and autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Language specific
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" Linting and formatting
" Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'mason-org/mason.nvim'
Plug 'mason-org/mason-lspconfig.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'nvimtools/none-ls.nvim'

" Alignment and indentation
Plug 'junegunn/vim-easy-align'
Plug 'lukas-reineke/indent-blankline.nvim'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Editing enhancements
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'gcmt/wildfire.vim'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" UI enhancements
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'goolord/alpha-nvim'
Plug 'folke/which-key.nvim'

" Session management
Plug 'tpope/vim-obsession'

" Colorscheme
Plug 'Mofiqul/dracula.nvim'

" Utilities
Plug 'christoomey/vim-tmux-navigator'
Plug 'lilydjwg/colorizer'
Plug 'preservim/tagbar'
Plug 'mbbill/undotree'

call plug#end()
"}}}

" General Settings {{{
filetype plugin indent on
set hidden
set clipboard=unnamedplus
set noshowmode
set ruler
set scrolloff=3
set t_Co=256
set encoding=utf8
syntax enable
set number relativenumber
set backspace=indent,eol,start
set cursorline
set wildignore+=.DS_Store
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

" Backup and swap
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
set undofile

" Search
set ignorecase
set smartcase
set hlsearch
" set incsearch

" Indentation
set expandtab
set textwidth=120
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

" Performance
set updatetime=300
set timeoutlen=500
set lazyredraw
set signcolumn=yes

" Folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevel=99
"}}}

" Leader key {{{
let mapleader = ","
"}}}

" Color Theme {{{
set termguicolors
let cur_hour = str2nr(strftime("%H", localtime()))
if cur_hour > 18 || cur_hour < 8
  colorscheme dracula
  set background=dark
else
  colorscheme dracula
  set background=dark
endif
"}}}

" Plugin Configurations {{{

" Nvim-tree configuration {{{

lua << EOF
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Custom keybindings
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
  -- vim.keymap.set("n", "p", api.tree.change_root_to_cwd, opts("Change root to CWD"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "o", api.node.open.edit, opts("Open"))
  vim.keymap.set("n", "v", api.node.open.vertical, opts("Open: Vertical Split"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))

  -- You can add more key mappings here
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = my_on_attach,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
})
EOF
map <C-n> :NvimTreeToggle<CR>
"}}}

" Telescope configuration {{{
lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
}
require('telescope').load_extension('fzf')
EOF

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>p <cmd>Telescope buffers<cr>
"}}}

" LSP Configuration {{{
lua << EOF
-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "pyright",
    "html",
    "cssls",
    "jsonls",
    "eslint",
    "jdtls",
  },
})

-- LSP setup
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- TypeScript/JavaScript
require("typescript").setup({
  server = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
    end,
  },
})

-- Python
lspconfig.pyright.setup({
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic",
      },
    },
  },
})

-- HTML
lspconfig.html.setup({
  capabilities = capabilities,
})

-- CSS
lspconfig.cssls.setup({
  capabilities = capabilities,
})

-- Java
lspconfig.jdtls.setup({
  capabilities = capabilities,
})

-- ESLint
lspconfig.eslint.setup({
  capabilities = capabilities,
})

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
EOF
"}}}

" Autocompletion with nvim-cmp {{{
lua << EOF
local cmp = require'cmp'
local luasnip = require'luasnip'

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' },
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF
"}}}

" Treesitter configuration {{{
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "tsx", "javascript", "python", "html", "css", "java", "json", "yaml", "markdown", "vim", "lua" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}
EOF
"}}}

" None-ls configuration for formatting {{{
lua << EOF
local status_ok, null_ls = pcall(require, "none-ls")
if not status_ok then
  return
end

null_ls.setup({
  sources = {
    -- Formatting
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown", "typescriptreact", "javascriptreact" },
    }),
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.stylua,
    
    -- Diagnostics
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,
  },
})

local status_ok2, mason_null_ls = pcall(require, "mason-null-ls")
if status_ok2 then
  mason_null_ls.setup({
    ensure_installed = { "prettier", "black", "isort", "stylua", "eslint", "flake8" },
  })
end
EOF
"}}}

" Comment.nvim configuration {{{
lua << EOF
vim.g.skip_ts_context_commentstring_module = true
require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})
EOF
nmap <leader>/ gcc
vmap <leader>/ gc
"}}}

" Autopairs configuration {{{
lua << EOF
require('nvim-autopairs').setup{}
EOF
"}}}

" Gitsigns configuration {{{
lua << EOF
require('gitsigns').setup{
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
}
EOF
"}}}

" Lualine configuration {{{
lua << EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
}
EOF
"}}}

" Bufferline configuration {{{
lua << EOF
require("bufferline").setup{
  options = {
    numbers = "buffer_id",
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
  }
}
EOF
"}}}

" Alpha (startify replacement) {{{
lua << EOF
local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  '                                                     ',
  '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
  '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
  '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
  '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
  '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
  '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
  '                                                     ',
}

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
EOF
"}}}

" Indent-blankline configuration {{{
lua << EOF
local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

ibl.setup {
  indent = {
    char = "┊",
  },
  scope = {
    enabled = false,
  },
}
EOF
"}}}

" Which-key configuration {{{
lua << EOF
require("which-key").setup {}
EOF
"}}}

" Tagbar configuration {{{
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30
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
"}}}

" Undotree configuration {{{
nnoremap <F5> :UndotreeToggle<CR>
"}}}

" Easy Align configuration {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"}}}

" Incsearch configuration {{{
" map /  <Plug>(incsearch-forward)
nnoremap <leader>s :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
nnoremap / /
vnoremap / /
" vnoremap / :<C-u>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>
" nnoremap <leader>/ /
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
"}}}

" Wildfire configuration {{{
map <SPACE> <Plug>(wildfire-fuel)
vmap <C-SPACE> <Plug>(wildfire-water)
"}}}

" Close tag configuration {{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.tsx,*.jsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,typescriptreact,javascriptreact'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,typescriptreact,javascriptreact'
"}}}

"}}}

" Key Mappings {{{

" Save with Ctrl-S
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" No need for ex mode
nnoremap Q <nop>

" Replace selected text in visual mode
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Autocomplete path
imap <S-Tab> <C-X><C-F>

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Clear search highlight
map <silent> <leader>qs <Esc>:noh<CR>

" Search and replace word under cursor
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>

" Buffer navigation
map <Leader>, <C-^>
map <Leader>ls :buffers<CR>
map gb :bnext<CR>
map gB :bprev<CR>

" Jump to buffer number
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

" Close Quickfix window
map <leader>qq :cclose<CR>

" Yank from cursor to end of line
nnoremap Y y$

" Join lines and restore cursor location
nnoremap J mjJ`j

" Diagnostics navigation
nnoremap <leader>] :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>[ :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>e :lua vim.diagnostic.open_float()<CR>

" Formatting
nnoremap <leader>F :lua vim.lsp.buf.format({ async = true })<CR>
vnoremap <leader>F :lua vim.lsp.buf.format({ async = true })<CR>

"}}}

" Functions {{{

" Strip trailing whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
noremap <leader>w :call StripWhitespace()<CR>

" Number toggle
function! NumberToggle()
  if(&rnu == 1)
    set rnu!
  else
    set rnu
  endif
endfunc
nnoremap <leader>l :call NumberToggle()<cr>

" Highlight interesting words
function! HiInterestingWord(n)
  normal! mz
  normal! "zyiw
  let mid = 86750 + a:n
  silent! call matchdelete(mid)
  let pat = '\V\<' . escape(@z, '\') . '\>'
  call matchadd("InterestingWord" . a:n, pat, 1, mid)
  normal! `z
endfunction

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" BufOnly function
command! -nargs=? -complete=buffer -bang Bonly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BOnly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang Bufonly :call BufOnly('<args>', '<bang>')
command! -nargs=? -complete=buffer -bang BufOnly :call BufOnly('<args>', '<bang>')

function! BufOnly(buffer, bang)
  if a:buffer == ''
    let buffer = bufnr('%')
  elseif (a:buffer + 0) > 0
    let buffer = bufnr(a:buffer + 0)
  else
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
        echomsg 'No write since last change for buffer' n '(add ! to override)'
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

" Newline enter function
function! NewlineEnter()
  if &buftype ==# 'quickfix'
    execute "normal! \<CR>"
  else
    normal! o
  endif
endfunction
nnoremap <CR> :call NewlineEnter()<CR>

"}}}

" Autocommands {{{

augroup general_config
  autocmd!
  
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  
  " Highlight overlength
  autocmd BufEnter * highlight OverLength ctermbg=DarkGray guibg=#592929
  autocmd BufEnter * match OverLength /\%79v./
augroup END

augroup filetype_specific
  autocmd!
  
  " Web development indentation
  autocmd FileType typescript,typescriptreact,javascript,javascriptreact,html,css,scss,json,yaml set ai sw=2 ts=2 sts=2
  
  " Python indentation
  autocmd FileType python set expandtab sw=4 ts=4 sts=4
  
  " Java indentation
  autocmd FileType java set expandtab sw=4 ts=4 sts=4
  
  " Markdown
  autocmd FileType markdown set wrap linebreak
  
  " Set filetypes
  autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
  autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
augroup END

" Terminal mode mappings
augroup terminal_config
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd TermOpen * startinsert
augroup END

"}}}

" Abbreviations {{{
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
iabbrev aa λ
"}}}

" vim: set foldmethod=marker:
