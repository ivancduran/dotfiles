syntax on
filetype plugin on

set termguicolors
set encoding=utf-8
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=120
set hidden
set cmdheight=2
set updatetime=300
set relativenumber
set rnu
set signcolumn=yes "espacio del lado izquierdo de los numeros
set laststatus=2  " Basic
set noshowmode  " Disable show mode info
set ttimeout
set ttimeoutlen=100
set timeoutlen=500
set showmatch
set mouse=a
set ttyfast

highlight ColorColumn ctermbg=0 guibg=lightgrey

function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer    gui=NONE guibg=#50fa7b guifg=#282a36
  hi! BuffetActiveBuffer     gui=NONE guibg=#bd93f9 guifg=#282a36
  hi! BuffetBuffer           gui=NONE guibg=#44475a guifg=#f8f8f2
  hi! BuffetModCurrentBuffer gui=NONE guibg=#8be9fd guifg=#282a36
  hi! BuffetModActiveBuffer  gui=NONE guibg=#ffb86c guifg=#282a36
  hi! BuffetModBuffer        gui=NONE guibg=#ff5555 guifg=#282a36
  hi! BuffetTrunc            gui=NONE guibg=#bd93f9 guifg=#282a36
  hi! BuffetTab              gui=NONE guibg=#bd93f9 guifg=#282a36
endfunction

"PLUGINS
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
" Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'glepnir/spaceline.vim'
Plug 'justinmk/vim-sneak'
" Plug 'yamatsum/nvim-cursorline'
Plug 'RRethy/vim-illuminate'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

Plug 'bronson/vim-trailing-whitespace'
Plug 'yggdroot/indentline'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'

Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'glepnir/dashboard-nvim'
Plug 'brooth/far.vim'
Plug 'bagrat/vim-buffet'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'gilsondev/searchtasks.vim'
Plug 'junegunn/goyo.vim'

"LANGUAGES
Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'amadeus/vim-mjml'
Plug 'ekalinin/dockerfile.vim'
Plug 'andrewstuart/vim-kubernetes'
Plug 'sbdchd/neoformat'
" Plug 'mhartington/formatter.nvim'

call plug#end()

colorscheme dracula

"KEY BINDINGS
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:go_fmt_command = "goimports"

let mapleader = " "
:imap ii <ESC>

" Explorer
map <C-x> :CocCommand explorer<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
nnoremap <leader>u :UndotreeToggle <bar> :UndotreeFocus<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>= :vertical resize +50<CR>
nnoremap <silent> <Leader>- :vertical resize -50<CR>
nnoremap <silent> <Leader>0 :vertical resize 100%<CR>
nnoremap <silent> <Leader>s :w<CR>

"FZF
map <C-p> :GFiles<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>ft <cmd>Filetypes<cr>
" nnoremap <leader>r :Rg<SPACE>
nnoremap <leader>r :CtrlSF<SPACE>
nnoremap <leader>a :Ag<SPACE>

nnoremap <silent> <Leader>di :SignifyDiff<CR>

"COC
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <leader>cr :CocRestart<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>p <Plug>(coc-format-selected)
nmap <leader>p <Plug>(coc-format)
nmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <F8> :Vista<CR>

" Treesitter init
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF

" lua <<EOF
" require('formatter').setup({
"   logging = false,
"   filetype = {
"     javascript = {
"         -- prettier
"        function()
"           return {
"             exe = "prettier",
"             args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
"             stdin = true
"           }
"         end
"     },
"     typescript = {
"         -- prettier
"        function()
"           return {
"             exe = "prettierd",
"             args = {vim.api.nvim_buf_get_name(0)},
"             stdin = true
"           }
"         end
"     }
"   }
" })
" EOF
" nnoremap <silent> <leader>f :Format<CR>
nnoremap <silent> <leader>nf :Neoformat<CR>

" dashboard session
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

let $FZF_DEFAULT_OPTS = '--reverse'

"Buffers
nmap <leader>bq :bufdo bd<CR>
nmap <leader>bc :bd<CR>
nmap <C-s> :bn<cr>
nmap <C-a> :bp<cr>
nmap <leader>bd :Bw<CR>
nmap <C-c> :Bw<CR>

let g:buffet_powerline_separators = 1
let g:buffet_use_devicons = 1
let g:buffet_modified_icon = ' [●] '

nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>b :e# <CR>

" identline
let g:indentLine_char = '▏'
let g:indent_blankline_char = '▏'

" let g:ctrlsf_auto_preview = 1
" let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_backend = 'rg'
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }
let g:ctrlsf_auto_focus = { "at":"start" }
let g:ctrlsf_auto_preview = 0
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_default_view = 'normal'
let g:ctrlsf_regex_pattern = 0
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '80'
let g:ctrlsf_default_root = 'cwd'
