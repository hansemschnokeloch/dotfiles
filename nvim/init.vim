" Autoload vimrc if modified
augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END
set nocompatible " vim not vi

"
" Plugins
"

" Check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

filetype off
call plug#begin('~/.config/nvim/plugged')

" Generating tmuxline and promptline
" Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim'

" Plug 'tpope/vim-scriptease' " a Vim plugin for Vim plugins
Plug 'tpope/vim-fugitive'

" Colorscheme
" Plug 'kaicataldo/material.vim'
" Plug 'altercation/vim-colors-solarized'
" Plug 'joshdick/onedark.vim'
" Plug 'trevordmiller/nova-vim'
" Plug 'rakr/vim-one'
Plug 'KeitaNakamura/neodark.vim'
" Plug 'zanglg/nova.vim'
" Plug 'gerardbm/vim-atomic'
" Plug 'nightsense/snow'
Plug 'nightsense/cosmic_latte'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'

" Syntax
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
" Plug 'gonzaloserrano/vim-markdown-todo'
" Plug 'fatih/vim-go' " Go language
" Plug 'jwalton512/vim-blade'
" Plug 'lumiliet/vim-twig'
" Plug 'nelsyeung/twig.vim'
Plug 'hansemschnokeloch/twig.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'Beerstorm/vim-brainfuck'

" Snippets
" Plug 'sniphpets/sniphpets'
" Plug 'sniphpets/sniphpets-common'
" Plug 'sniphpets/sniphpets-symfony'

" File search
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'craigemery/vim-autotag' " update tags on save
Plug 'ludovicchabant/vim-gutentags' " tag files management

" Coding
Plug 'Raimondi/delimitMate' " autoclose parenthesis, brackets...
" Plug 'ervandew/supertab' " autocompletion with tab
Plug 'tomtom/tcomment_vim' " comment lines
Plug 'ntpeters/vim-better-whitespace' " show and fixes extrawhitespaces
" Plug 'mattn/emmet-vim' " Emmet
Plug 'captbaritone/better-indent-support-for-php-with-html' " better php html indentation
Plug 'tpope/vim-surround' " quoting/parentesizing made simple
Plug 'nathanaelkane/vim-indent-guides'
Plug 'arnaud-lb/vim-php-namespace'
" Plug 'tobyS/pdv'
Plug 'Rican7/php-doc-modded'

" Completion & linting
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'w0rp/ale' " linting

" UI
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()
filetype plugin indent on " Filetype auto-detection

" set map leader
let mapleader = ' '
let localmapleader = '§'

" files
set nobackup " no backups
set nowritebackup " no backups
set noswapfile " no swap files
set autoread " if a file is changed on disk load it
set hidden " allow buffers with unsaved changes
set encoding=utf8

" tabs and indentation
set expandtab " use spaces instead of tabs
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set autoindent " automatically set indent of new line
set smartindent " automatically inserts one extra level of indentation

" folding
set foldmethod=marker " fold based on marker
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" user interface
syntax on "syntax highlighting
set number " show line numbers
set relativenumber " show relative line number
set backspace=indent,eol,start " allow backspace over autoindent, line breaks and start of insert
let base16colorspace=256  " access colors present in 256 colorspace
set t_Co=256 " explicitly tell vim that the terminal supports 256 colors
if has("termguicolors")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
set laststatus=2 " show the status line all the time
set cursorline " highlight cursor line

" colorscheme
set background=dark
colorscheme cosmic_latte
" colorscheme neodark


" searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search patterns
set incsearch " start searching while typing
nnoremap <silent> <leader>s :noh<CR>

" performance
set ttyfast " faster redrawing
set nolazyredraw " don't redraw while executing macros
" OSX clipboard
set clipboard=unnamed
" matching
set showmatch " show matching braces
set matchtime=3 " how many tenths of a second to show
" ctags
" set tags=./tags;~/_DEV

"
" Plugins configuration
"


" === kaicataldo/material.vim ===
" let g:material_theme_style='palenight'
" let g:material_terminal_italics = 1
" === altercation/vim-colors-solarized
" === joshdick/onedark.vim
" === trevordmiller/nova-vim
" === rakr/vim-one
" === KeitaNakamura/neodark.vim
" === zanglg/nova.vim
" === nightsense/snow
" let g:airline_theme='snow_dark'
" let g:airline_theme='snow_light'
" === nightsense/cosmic_latte
let g:airline_theme='cosmic_latte_dark'
" let g:airline_theme='cosmic_latte_light'
" === gerardbm/vim-atomic
" AtomicDarkCyanSoft
" === pangloss/vim-javascript
" === jelera/vim-javascript-syntax
" === gonzaloserrano/vim-markdown-todo
" === fatih/vim-go
" === jwalton512/vim-blade
au BufNewFile,BufRead *.blade.php set filetype=blade " Set blade extension syntax
" === lumiliet/vim-twig
" === hansemschnokeloch/twig.vim
" === stephpy/vim-php-cs-fixer
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" === Raimondi/delimitMate
let g:delimitMate_expand_cr = 1
" let g:delimitMate_expand_space = 1
let delimitMate_matchpairs = "(:),[:],{:}"
au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
au FileType htmldjango.twig let b:delimitMate_matchpairs = "(:),[:],{:},<:>"
" imap <C-K> <Plug>delimitMateS-Tab
" === ervandew/supertab
" let g:SuperTabDefaultCompletionType = "<c-n>" " Reverse order
" === tomtom/tcomment_vim
" === ntpeters/vim-better-whitespace
highlight ExtraWhitespace ctermbg=1
" === mattn/emmet-vim
" let g:user_emmet_leader_key='<C-j>'
" === captbaritone/better-indent-support-for-php-with-html
" === tpope/vim-surround
" === nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 1
let g:indent_guides_start_level = 2
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" === arnaud-lb/vim-php-namespace
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
" autocmd FileType php inoremap <Leader>pnu <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>uu :call PhpInsertUse()<CR>
let g:php_namespace_sort_after_insert=1
" === tobyS/pdv
" === Rican7/php-doc-modded
" PHP documenter script bound to Control-P
autocmd FileType php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <C-p> :call PhpDocRange()<CR>  let g:user_emmet_mode='i'
" === neoclide/coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Activate html for twig
" autocmd FileType html.twig :call CocAction('activeExtension', 'coc-html')
" === phpactor/phpactor
" autocmd FileType php setlocal omnifunc=phpactor#Complete
" === w0rp/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
" let g:ale_open_list = 1
" === Yggdroot/LeaderF
nnoremap <leader>gf :LeaderfTagCword<cr>
nnoremap <leader>gg :LeaderfRgInteractive<cr>
nnoremap <leader>t :LeaderfBufTag<cr>
nnoremap / :LeaderfLine<cr>
" === craigemery/vim-autotag
" === ludovicchabant/vim-gutentags
let g:gutentags_ctags_auto_set_tags = 1
let g:gutentags_cache_dir = '~/.vim/gutentags'
let g:gutentags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
" === scrooloose/nerdtree
let NERDTreeChDirMode=2 " auto cd on bookmark
let g:NERDTreeQuitOnOpen=1 " close NERDTree after a file is opened
let g:NERDTreeNodeDelimiter = "\u00a0"
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <leader>n :NERDTree<space>
" === tiagofumo/vim-nerdtree-syntax-highlight
" let g:NERDTreeDisableFileExtensionHighlight = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1
" === vwxyutarooo/nerdtree-devicons-syntax
" === bling/vim-airline
let g:airline_powerline_fonts = 1 " use powerline fonts
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
" let g:airline_theme='simple'
" === jeffkreeftmeijer/vim-numbertoggle

" Disable hmtl link highlight
highlight link htmlLink text

" Esc mapping
imap jk <Esc>

" -> mapping
inoremap ?? ->
inoremap ?. =>
inoremap ?p <?php  ?><left><left><left>
inoremap ?P <?php
inoremap ?K {%  %}<left><left><left>

" window navigation
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" buffer navigation
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>w :bd<CR>

" Jump to tag
map gf <C-]>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk

" change cursor position in insert mode
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-k> <up>
inoremap <C-j> <down>

