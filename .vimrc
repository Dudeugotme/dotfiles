" Disable vi compatibility
set nocompatible

" source plugins file
so ~/dotfiles/.vim/plugins.vim

syntax enable
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set number								"Let's activate line numbers.

"-------------Visuals--------------"
" set background=$BACKGROUND
" colorscheme $THEME
set t_CO=256								"Use 256 colors. This is useful for Terminal Vim.

set background=dark
colorscheme atom-dark-256 

set guifont=Source\ Code\ Pro\ for\ powerline:h13						"Set the default font family and size.
set guioptions-=e							"We don't want Gui tabs.
set linespace=15   						        "Macvim-specific line-height.

set guioptions-=l                                                       "Disable Gui scrollbars.
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T

"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.

"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

set go-=L " Removes left hand scroll bar

set linespace=5
set termencoding=utf-8
set encoding=utf-8

set nohidden
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " always set autoindenting on
set number                      " always show line numbers

" -- Search
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100

" -- Beep
set visualbell                  " don't beep
set noerrorbells                " don't beep

set autowrite                   "Save on buffer switch
set mouse=a
set showmatch
set showcmd                     " show command in status line
set scrolloff=1
set lazyredraw                  " Don't redraw the screen when running macros.
set wildmode=list:full,full
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set wildignore+=*/vendor/**

" Set tags
set tags+=./tags.vendors,tags.vendors
set clipboard=unnamed

" fast scrolling
set ttyfast

" Retain buffer until quit
set hidden

" Line numbers are nice
set ruler

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

"-------------Mappings--------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>vi :tabedit $MYVIMRC<cr>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

" -------------Abbr ---------------"
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter

"-------------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

nmap <C-p> :CtrlP<cr>
nmap <C-r> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>


"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"Make NERDTree easier to toggle.
nmap <C-b> :NERDTreeToggle<cr>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>

vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-"}'<cr>

"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.
" Powerline bar configuration
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
" set laststatus=2

"Easy escaping to normal model
imap jk <esc>

" Run php linter on current file
map <Leader>l :!php -l %<cr>
nmap <leader>m :call PhpCsFixerFixFile()<cr>

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap ,todo :e todo.txt<cr>

" source vimrc file when saving it
" Delete all buffer
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
"let g:powerline_config_overrides={'common': {'reload_config': 0}}

" turn off nohlsearch
nmap <silent> <leader><Space> :nohlsearch<CR>

" Switch between files with
nnoremap <leader><leader> <c-^>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Search
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

