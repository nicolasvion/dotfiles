" ---------- plugins installation ---------- #

call plug#begin()

" theme
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'

" focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'szw/vim-maximizer'
Plug 'kshenoy/vim-signature'

" functionalities

"" folder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mcchrish/nnn.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"" git
Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'

"" tagbar
Plug 'majutsushi/tagbar'

"" completion insert tab
Plug 'ervandew/supertab'

"" syntax
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'Yggdroot/indentLine'

"" dict and color
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'

" coding
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'mbbill/undotree'

"" infra
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'

"" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'skanehira/preview-markdown.vim'

"" python
Plug 'heavenshell/vim-pydocstring'
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'

"" utilities
Plug 'azadkuh/vim-cmus'
Plug 'voldikss/vim-floaterm'
Plug 'puremourning/vimspector'

call plug#end()

" ---------- end plugins installation ---------- #


" ---------- nvim basic configuration ---------- #

let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" ---------- nvim basic configuration ---------- #


" ---------- global options ---------- #

" must be set for putty
set t_Co=16

" theme
if $color == 'gruvbox'
  colorscheme gruvbox
else
  color nord
endif
let g:airline_theme='minimalist'
set nocompatible
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]


let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1

function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'w': '~/work' },
            \ ]

let g:startify_enable_special = 0

" basic options
set history=10000
set modeline
set modelines=5     " Debian likes to disable this
set backspace=indent,eol,start

set undodir=~/.config/nvim/undodir
set undofile
set noswapfile
set autoread

" performance
" default = 4000 : delays and poor user experience.
set updatetime=50

" viminfo
set viminfo='20,\"500,h
set viminfo+=n~/.config/nvim/viminfo

" encoding
set encoding=utf-8
set fileencodings=utf-8,latin1,default
set fileformats=unix,dos,mac

" default formating
set shiftwidth=2
set expandtab
set smarttab

" indent options
" set autoindent
set copyindent
set smartindent

" set indent for different language
au FileType sh setl sw=4 sts=4 et
au FileType bash setl sw=2 sts=2 et
au FileType go setl sw=2 sts=2 et
au FileType python setl sw=4 sts=4 et
au FileType ruby setl sw=2 sts=2 et
au FileType vcl setl sw=2 sts=2 et
au FileType tf setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
filetype indent plugin on

" others options
syntax enable
set number
set numberwidth=5
set colorcolumn=80
set showcmd
set laststatus=2

set fo=cqt
set fdm=marker
set ruler

" automatically change window's cwd to file's dir
set autochdir

set selection=inclusive
set virtualedit=block


set hlsearch
set incsearch

set ignorecase
set smartcase

set scrolloff=3
set sidescrolloff=5
set scrolljump=1

set completeopt=longest,menu,preview

set timeoutlen=250

" shell
set shell=/bin/zsh

" mac os speed
set nocursorline
set lazyredraw

" when editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
  \ endif

" ---------- end global options ---------- #


" ---------- mappings ---------- #

" leader key
let mapleader = "\<Space>"

" ## globals ##

" <ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> ;l :nohl<CR><C-l>

" change visual block mode with , + e (next, I, type your char, esc)
nnoremap ,e <C-v>

" paste tools
set pastetoggle=<c-p>

" plugins shortcuts
nnoremap ,f :NERDTreeToggle<cr>
nmap ,c :TagbarToggle<CR>

" files search
nmap ,wa :AnsibleFiles<CR>
nmap ,ww :WorkFiles<CR>

" git grep
nmap gg :GGrep<CR>

" goyo
nmap go :Goyo 95%x95%<CR>

" ranger
nnoremap <silent> rr :RangerCurrentFileExistingOrNewTab<CR>

" nnn
nnoremap <silent>,n :NnnPicker<CR>

" trim whitespace
noremap <silent>;t :call TrimWhitespace()<CR>

" make
noremap <silent>mk :!make pdf<CR>

" ycm goto
nnoremap <silent> yg :YcmCompleter GoTo<CR>
nnoremap <silent> yr :YcmCompleter GoToReferences<CR>
let g:vimspector_enable_mappings = 'HUMAN'
nmap ,vc <Plug>VimspectorContinue

" ripgrep
noremap <silent>rg :Rg<Space>

" undotree
noremap <silent>,u :UndotreeShow<CR>

" limelight
nmap ,l :Limelight!!<CR>

" source vimrc file
nmap ,r :source ~/.config/nvim/init.vim<CR>

" launch zsh shell
nnoremap ,s :shell<CR>

" toggle mouse mode
map ,m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

" coding
noremap t {
noremap f }

" ## pane management ##

" pane management - vertical buffer with pv or ctrl + v
nnoremap pv <C-w>v<C-w>l

" pane management - horizontal buffer with ph or ctrl + h
nnoremap ph :split<CR>

" switch pane with pr
nnoremap pr <C-w>r

" mapping md to markdown renderer via mdr
" https://github.com/MichaelMure/mdr.git
noremap ,md :PreviewMarkdown<CR>
let g:preview_markdown_parser="glow"
let g:preview_markdown_vertical=1

" mapping ps,pz,pd,ps to switch beetween pane
noremap ps  <c-w>j
noremap pz <c-w>k
noremap pd <c-w>l
noremap pq <c-w>h

" ctrl + z to maximize current pane
nnoremap <silent>,z :MaximizerToggle<CR>
vnoremap <silent>,z :MaximizerToggle<CR>gv
inoremap <silent>,z <C-o>:MaximizerToggle<CR>

" ## tab management ##
nnoremap tt <Esc>:tabnew<CR>
nnoremap tn <Esc>:tabnext<CR>
nnoremap tp <Esc>:tabprevious<CR>
nnoremap tc <Esc>:tabclose<CR>
nnoremap to <Esc>:tabedit
nnoremap tf <Esc>:tabfirst<CR>
nnoremap tl <Esc>:tablast<CR>
nnoremap tm <Esc>:tabm

" ## cmus controls ##
nnoremap cc :CmusCurrent<cr>
nnoremap c- :CmusPrevious<cr>
nnoremap cp :CmusPlay<cr>
nnoremap cs :CmusPause<cr>
nnoremap cs :CmusStop<cr>
nnoremap c+ :CmusNext<cr>

" launch gitlog
nnoremap gs :Git status<cr>
nnoremap gf :Git pull<cr>
nnoremap gd :Git diff<cr>
nnoremap gl :Glog<cr>
nnoremap gb :Twiggy<cr>

" ## formating ##
nnoremap fj :%!jq '.'<CR>
nnoremap fn :%!js-beautify -j -s 2 -f -<CR>
nnoremap fp :Autopep8<CR>

" ## floaterm
nnoremap <silent> ,t :FloatermNew<CR>
nnoremap <silent> ,tf :FloatermNew fzf<CR>
nnoremap <silent> ,tg :FloatermNew lazygit;exit<CR>

" ---------- end mappings ---------- #


" ---------- functions and plugins params ---------- #

" ## functions ##

" mouse mode only for nerdtree
function NERDTreeMouse()
    if (&ft ==? "nerdtree")
        set mouse=a
    else
        set mouse=
    endif
endfunction

" trim White Space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" ## plugins params
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

" ycm
let g:ycm_key_list_select_completion = ['<tab>']
let g:ycm_key_list_previous_completion = ['<S-tab>']

" ultisnip
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsListSnippets="<c-l>"

" linters and formating
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" python format
let g:autopep8_disable_show_diff=1

" use XHTML and CSS with :TOhtml
let use_xhtml=1
let html_use_css=1
let html_ignore_folding=1
let html_use_encoding="UTF-8"

" lua
let lua_version=5
let lua_subversion=1

" python
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_numbers=1
let python_highlight_space_errors=1
autocmd VimEnter *.py nested :TagbarOpen
au BufRead,BufNewFile *.py setlocal textwidth=80

" ruby
let ruby_operators=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:vimrubocop_keymap = 0
nnoremap <C-R> :RuboCop<CR>

" rails
let g:rails_gnu_screen=1
let g:rails_mappings=1
let g:rails_syntax=1

" markdown plugin
let g:vim_markdown_folding_disabled = 1
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vmt_auto_update_on_save = 1
au BufRead,BufNewFile *.md setlocal textwidth=80

" check language
set spelllang=fr,en_us,en_gb
autocmd FileType mail set spell

" limelight
let g:limelight_conceal_ctermfg = 'blue'

" open NerdTree if no file specified
au vimenter * if !argc() | Startify | NERDTree | endif
let NERDTreeShowBookmarks=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize = 35
let g:NERDTreeMouseMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = '%#NonText#'
let NERDTreeIgnore = ['\.pyc$','.idea']

au FileType * :call NERDTreeMouse()
au WinEnter * :call NERDTreeMouse()
au WinLeave * :call NERDTreeMouse()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf
command! -bang AnsibleFiles call fzf#vim#files('~/work/ansible', {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang WorkFiles call fzf#vim#files('~/work/', {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" nnn - disable default mappings
let g:nnn#set_default_mappings = 0

" nnn layout
let g:nnn#layout = 'new' " or vnew, tabnew etc.
let g:nnn#layout = { 'left': '~20%' } " or right, up, down
" floating window (neovim latest and vim with patch 8.2.191)
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ 'tt': 'tab split',
      \ 'ph': 'split',
      \ 'pv': 'vsplit' }

" superTab Completion
let g:SuperTabDefaultCompletionType = "context"

" trail whitespace when saving
autocmd BufWritePre * :call TrimWhitespace()

" ---------- end functions ---------- #
