""" init.vim - VSCode-like Configuration for Neovim
" Ensure vim-plug is installed: https://github.com/junegunn/vim-plug

" Specify where plugins will be stored
call plug#begin('~/.vim/plugged')

" Essential plugins
Plug 'neovim/nvim-lspconfig'       " Language Server Protocol support
Plug 'hrsh7th/nvim-cmp'            " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'        " LSP completion source for nvim-cmp
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlighting
Plug 'kyazdani42/nvim-tree.lua'    " File explorer
Plug 'nvim-lualine/lualine.nvim'   " Statusline
Plug 'akinsho/bufferline.nvim'     " Tabline for buffers
Plug 'akinsho/toggleterm.nvim'     " Terminal integration
Plug 'nvim-telescope/telescope.nvim', {'do': 'make'} " Fuzzy finder
Plug 'nvim-lua/plenary.nvim'       " Required dependency for telescope
Plug 'lewis6991/gitsigns.nvim'     " Git signs in gutter
Plug 'windwp/nvim-autopairs'       " Auto-close brackets and quotes
Plug 'numToStr/Comment.nvim'       " Commenting shortcuts
Plug 'glepnir/dashboard-nvim'      " Start screen with shortcuts
Plug 'kyazdani42/nvim-web-devicons'  " Icon support
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'Mofiqul/vscode.nvim'         " VSCode theme
Plug 'wfxr/minimap.vim'
Plug 'voldikss/vim-floaterm'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'airblade/vim-gitgutter'
Plug 'ggml-org/llama.vim'
call plug#end()

" General Settings
set number                 " Show line numbers
set relativenumber         " Relative line numbers
set tabstop=4              " Tab size of 4 spaces
set shiftwidth=4           " Indent size of 4 spaces
set expandtab              " Use spaces instead of tabs
set mouse=a                " Enable mouse support
set clipboard=unnamedplus  " Use system clipboard
set ignorecase             " Case insensitive search
set incsearch              " Show search matches as you type
set hlsearch               " Highlight search results
set smartcase              " Case sensitive if search contains capitals
set termguicolors          " Enable true color support
set lazyredraw             " Faster scrolling
set updatetime=300         " Faster completion
set timeoutlen=500         " Faster mappings
set scrolloff=8

let g:mapleader=" "

" Plugin Configurations
" Lualine
lua << EOF
require('lualine').setup {
  options = {
    theme = 'vscode'
  }
}
EOF

" Nvim-tree
lua require('nvim-tree').setup {}

" Treesitter
lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
EOF

" ToggleTerm
lua << EOF
require('toggleterm').setup {
  open_mapping = [[<C-t>]],
  direction = 'float',
}
EOF

" Gitsigns
lua require('gitsigns').setup {}

" Autopairs
lua require('nvim-autopairs').setup {}

" Comment.nvim
lua require('Comment').setup {}

" Telescope
lua require('telescope').setup {}

" Dashboard
let g:dashboard_default_executive = 'telescope'

" Buffer (Tabs)
lua require("bufferline").setup{}

" Configure Python LSP
lua require'lspconfig'.pyright.setup{ capabilities = require('cmp_nvim_lsp').default_capabilities(), }

" Minimap
lua require('mini.map').setup()

" Configure C LSP
lua << EOF
require('lspconfig').clangd.setup {
  cmd = { "clangd" },  -- Command to start the clangd server
  filetypes = { "c", "cpp", "objc", "objcpp" },  -- Filetypes to attach the server
  root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),  -- Root directory
  capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Autocompletion support
}
EOF

" Colorscheme
colorscheme vscode

" Toggle comment
nnoremap <C-\> :lua require('Comment.api').toggle.linewise.current()<CR>
vnoremap <C-\> :lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>

" Toggle file explorer
nnoremap <leader>z :NvimTreeToggle<CR>

" Buffer (Tabs)
nnoremap tn :BufferLineCycleNext<CR>
nnoremap tp :BufferLineCyclePrev<CR>

" Open terminal
nnoremap <C-t> :ToggleTerm<CR>

nnoremap <C-p> :Telescope find_files<CR> " Find files
nnoremap <S-p> :Telescope live_grep<CR>  " Live grep
nnoremap <leader>fb :Telescope buffers<CR>    " List buffers

" Map <Esc> to exit Terminal mode and go to Normal mode
tnoremap <Esc> <C-\><C-n>

" Save and Quit
nnoremap <leader>s :w<CR>  " Save file with leader+w
nnoremap <leader>q :bd<CR> " Quit with leader+q

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

" Open minimap with <C-m>
nnoremap <C-m> :MinimapToggle<CR>

" Set minimap to be on the right side of the window
let g:minimap_width = 20
let g:minimap_auto_start = 1
let g:minimap_git_colors = 1

" Move the current line or a selection to the right with Tab
nnoremap <Tab> >>_
vnoremap <Tab> >gv

" Move the current line or a selection to the left with Shift-Tab
nnoremap <S-Tab> <<_
vnoremap <S-Tab> <gv

" Generalized buffer switching with user input
nnoremap tb :lua require("bufferline").go_to_buffer(tonumber(vim.fn.input("Buffer number: ")), true)<CR>

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

let g:llama_config = { 'endpoint': 'http://localhost:8012/infill', 'auto_fim' : v:false }