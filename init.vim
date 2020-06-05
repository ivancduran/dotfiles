"CONFIGURATION

syntax on

set termguicolors

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

set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=lightgrey

"PLUGINS
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
"Plug 'kien/ctrlp.vim'
"Plug 'jeetsukumaran/vim-buffergator'
"Plug 'bling/vim-bufferline'
Plug 'fholgado/minibufexpl.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'thaerkh/vim-workspace'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'leafgarland/typescript-vim'
"Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
"Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
"LANGUAGES 
Plug 'fatih/vim-go'

call plug#end()

colorscheme dracula

"KEY BINDINGS 
if executable('rg')
    let g:rg_derive_root='true'
endif

"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_use_caching = 0
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:go_fmt_command = "goimports"

let mapleader = " "
"map <C-b> :NERDTreeToggle<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +10<CR>
nnoremap <silent> <Leader>- :vertical resize -10<CR>

" Fzf
map <C-p> :GFiles<CR>
nnoremap <leader>f :BLines<CR>
nnoremap <leader>b :Buffers<CR>

"Coc
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nnoremap <leader>cr :CocRestart

"nnoremap <leader>p :PrettierAsync<CR>

"map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
"map <F3> :source ~/vim_session <cr>     " And load session with F3
"
"fu! savesess()
    "execute 'call mkdir(%:p:h/.vim)'
    "execute 'mksession! %:p:h/.vim/session.vim'
"endfunction

"fu! restoresess()
"execute 'so %:p:h/.vim/session.vim'
"if bufexists(1)
    "for l in range(1, bufnr('$'))
        "if bufwinnr(l) == -1
            "exec 'sbuffer ' . l
        "endif
    "endfor
"endif
"endfunction

"autocmd vimleave * call savesess()
"autocmd vimenter * call restoresess()

let g:workspace_autosave_always = 1
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir = $HOME . '/.vim/sessions/.undodir'


"let g:ale_fixers = {
"\   'javascript': ['prettier'],
"\   'css': ['prettier'],
"\}

let g:prettier#config#config_precedence = 'file-override'

" Explorer
"map <C-,> :CocCommand explorer<CR>
map <C-b> :CocCommand explorer --preset floating<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
