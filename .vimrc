"syntax on

set encoding=utf-8
set number
set relativenumber
set expandtab
set tabstop=2


"set path+=**
"set wildmenu

set hlsearch
set incsearch

"command! MakeTags !ctags -R .


call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'tell-k/vim-autopep8'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"Plug 'tpope/vim-commentary'
"Plug 'python-rope/ropevim'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"Plug 'python-mode/python-mode'


call plug#end()
"remap esc to caps
"vnoremap jj <esc>
let ropevim_vim_completion=1


"coc
set statusline^=%{coc#status()}
set updatetime=300
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

"disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

"switch between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
 
map <C-n> :NERDTreeToggle<CR>
map <leader>gd <Plug>(coc-definition)
map <leader>gr <Plug>(coc-references)
noremap <C-f> :GFiles<CR>
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark
"set background=light
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material


let g:airline_theme = 'gruvbox_material'

