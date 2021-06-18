set nocompatible
filetype off

call plug#begin()
Plug 'airblade/vim-gitgutter'     " Show git diff of lines edited
Plug 'tpope/vim-fugitive'         " :Gblame
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'

"Search
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'rstacruz/vim-hyperstyle'
Plug 'jiangmiao/auto-pairs'
Plug 'pearofducks/ansible-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim'   " TypeScript syntax
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'alvan/vim-closetag'

" Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'styled-components/vim-styled-components'
" Plug 'editorconfig/editorconfig-vim'

" Vim Theme
" Plug 'sainnhe/sonokai'
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'    " Vim powerline
Plug 'majutsushi/tagbar'


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

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set laststatus=2 " Always show the status line
set clipboard=unnamedplus " Allow copy and paste from system clipboard
set backspace=indent,eol,start " Delete characters outside of insert area
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Enable line highlight
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=235 gui=NONE guifg=NONE guibg=NONE

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
" set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits

" autocmd BufNewFile,BufRead *.yaml.hbs   set syntax=ansible

" Buffer Highlight
syntax sync fromstart
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

fu! RestoreSess()
if filereadable(getcwd() . '/Session.vim')
    execute 'so ' . getcwd() . '/Session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimEnter * nested call RestoreSess()

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


" Download font JetBrainsMono with Nerd Font Patch
" https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Medium/complete
set guifont="JetBrainsMono Nerd Font Mono 14"

" Numbers
set number
set numberwidth=4
set ruler

if has('termguicolors')
  set termguicolors
endif

" get rid of [  ] around icons in NerdTree
" https://github.com/ryanoasis/vim-devicons/issues/154
syntax enable
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" ColorScheme
colorscheme OceanicNext
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" colorscheme sonokai
" let g:sonokai_style = 'default'
" let g:sonokai_enable_italic_font = 1
" let g:sonokai_transparent_background = 1
" let g:enable_bold_font = 1

" Configure the Tabline
let g:airline_extensions = ['tabline', 'tagbar']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1 " enable/disable displaying buffers with a single tab
let g:airline#extensions#tabline#show_splits = 1 "enable/disable displaying open splits per tab (only when tabs are opened). >
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tagbar#enabled = 1
let g:airline_detect_modified=1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_z = airline#section#create(['%l/%c'])

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
if has('nvim')
  " Source Vim configuration
  nnoremap <silent><leader>1 :w! \| :source ~/.config/nvim/init.vim<CR>

  " Open Vim configuration file for editing
  nnoremap <silent><leader>2 :e ~/.config/nvim/init.vim<CR>

  " Source Vim configuration file and install plugins
  nnoremap <silent><leader>3 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
else
  " Source Vim configuration
  nnoremap <silent><leader>1 :w! \| :source ~/.vimrc<CR>

  " Open Vim configuration file for editing
  nnoremap <silent><leader>2 :e ~/.vimrc<CR>

  " Source Vim configuration file and install plugins
  nnoremap <silent><leader>3 :source ~/.vimrc \| :PlugInstall<CR>

endif

" NERDTree Config
nnoremap <silent>F :NERDTreeFocus<CR>
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

" CoC extensions
let g:coc_global_extensions = ['coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
 let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Remap keys for applying codeAction to the current buffer.
nmap <leader>da  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" coc.vim config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" end coc.vim config
let g:fugitive_pty = 0


" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'javascript.js': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'