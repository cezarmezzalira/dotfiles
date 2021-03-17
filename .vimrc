set nocompatible
filetype off


call plug#begin()

Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'preservim/nerdtree'

Plug 'rstacruz/vim-hyperstyle'
Plug 'jiangmiao/auto-pairs'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'styled-components/vim-styled-components'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'    " Vim powerline
" Vim Theme
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()              " required
filetype plugin indent on    " required

" Leader key is SPACE, I find it the best
let mapleader = " "

" Look and Feel settings
syntax enable
set background=dark
set wildmenu " when opening a file with e.g. :e ~/.vim<TAB> there is a graphical menu of all the matches
set ttyfast
set lazyredraw
set updatetime=300

" Enable line highlight
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234

" Download font JetBrainsMono with Nerd Font Patch
" https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Medium/complete
set guifont="JetBrainsMono Nerd Font Mono 14"

" Numbers
set number
set numberwidth=4
set ruler

" Theme
" colorscheme hybrid_material
" colorscheme tonic

if has('termguicolors')
  set termguicolors
endif

let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic_font = 1
let g:sonokai_transparent_background = 1
let g:enable_bold_font = 1

" ColorScheme
colorscheme sonokai

" Configure the Tabline
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_z = airline#section#create(['%l/%c'])

" Indentation
set autoindent
set cindent
set smartindent

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Tab Options
set shiftwidth=2
set tabstop=2
set softtabstop=2 " Number of spaces a tab counts when editing
set expandtab

" Terminal Settings
set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits

" Buffer Highlight
syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

set ignorecase " Ignore case when searching
set smartcase  " When searching try to be smart about cases
set nohlsearch " Don't highlight search term
set incsearch  " Jumping search

" Always show the status line
set laststatus=2

" Allow copy and paste from system clipboard
set clipboard=unnamedplus
" vmap "+y :!xclip -f -sel clip<CR>
" map "+p :-1r !xclip -o -sel clip<CR>

" Delete characters outside of insert area
set backspace=indent,eol,start

" +++ Shortcuts +++
" Open Buffer
nnoremap <silent><leader>l :buffers<CR>
" Vertically split screen
nnoremap <silent><leader>/ :vs<CR>
" Split screen
nnoremap <silent><leader>- :split<CR>
" Delete Current Buffer
nnoremap <silent><leader>' :bd<CR>

" Buffers Navigation
map <leader>, :bp<cr>
map <leader>. :bn<cr>

" force reload current file
map <leader>r :e!<CR>

" Faster saving and exiting
nnoremap <silent><leader>w :w!<CR>
nnoremap <silent><leader>q :q!<CR>
nnoremap <silent><leader>x :x<CR>

" Source Vim configuration
nnoremap <silent><leader>1 :w! \| :source ~/.vimrc<CR>

" Open Vim configuration file for editing
nnoremap <silent><leader>2 :e ~/.vimrc<CR>

" Source Vim configuration file and install plugins
nnoremap <silent><leader>3 :source ~/.vimrc \| :PlugInstall<CR>

" NERDTree Config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Show hidden files on NERDTree
let NERDTreeShowHidden=1

" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"     \ quit | endif

" AutoRefresh when NERDTreeFocus
autocmd BufEnter NERD_tree_* | execute 'normal R'

" get rid of [  ] around icons in NerdTree
" https://github.com/ryanoasis/vim-devicons/issues/154
syntax enable
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:fugitive_pty = 0
