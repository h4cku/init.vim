" Ensure compatibility with moder Neovim features
set nocompatible

" Enable syntax highlighting
syntax on

" File encoding settings
set encoding=utf-8
set fileencoding=utf-8

" General settings
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set mouse=a
set clipboard=unnamedplus

" Tabs and identation
set cursorcolumn
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Visual settings
set termguicolors
set background=dark

" Performance settings
set lazyredraw
set updatetime=300
set timeoutlen=500
set scrolloff=8

" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'neovim/nvim-lspconfig'
Plug 'numToStr/Comment.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag' : '0.1.8' }
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/toggleterm.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'airblade/vim-gitgutter'
Plug 'ggml-org/llama.vim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
call plug#end()

" Setting theme
colorscheme dracula 

let g:mapleader=" "

" Setup plugins
lua require('Comment').setup()
lua require('toggleterm').setup { direction = 'float', open_mapping = [[<C-t>]] }
lua require("lualine").setup()

" Be able to go to normal model pressing ESC when in a terminal
tnoremap <Esc> <C-\><C-n>

" Configure key bindings for Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Configure key bindings for toggle comment
nnoremap <C-\> :lua require('Comment.api').toggle.linewise.current()<cr>
vnoremap <C-\> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>

" Move line up
nnoremap <A-UP> :m .-2<CR>==
" Move line down
nnoremap <A-DOWN> :m .+1<CR>==
" Move selection up
xnoremap <A-UP> :m '<-2<CR>gv=gv
" Move selection down
xnoremap <A-DOWN> :m '>+1<CR>gv=gv

" Jump to definition (LSP)
nnoremap <C-d> :lua vim.lsp.buf.definition()<CR>


" Move the current line or a selection to the right with Tab
nnoremap <Tab> >>_
vnoremap <Tab> >gv
" Move the current line or a selection to the left with Shift-Tab
nnoremap <S-Tab> <<_
vnoremap <S-Tab> <gv

" Key bindings to switch between buffers
nnoremap <A-l> :bNext<CR>
nnoremap <A-h> :bprevious<CR>
nnoremap <leader>q :bd<CR>

" Key bindings for GitGutter
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Set the endpoints for llama.vim
let g:llama_config = { 'endpoint': 'http://localhost:8012/infill', 'auto_fim' : v:false }

" LSP and Formatter configuration
lua require('init')
