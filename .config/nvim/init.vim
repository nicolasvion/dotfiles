" ---------- plugins installation ---------- #

call plug#begin()

" theme
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'szw/vim-maximizer'
Plug 'kshenoy/vim-signature'

" training
Plug 'ThePrimeagen/vim-be-good'

" functionalities

"" folder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'weirongxu/coc-explorer'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'jremmen/vim-ripgrep'

"" cheat.sh
Plug 'dbeniamine/cheat.sh-vim'

"" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/gina.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/gv.vim'

"" gitlab
Plug 'shumphrey/fugitive-gitlab.vim'

"" tagbar
Plug 'majutsushi/tagbar'

"" syntax
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'Yggdroot/indentLine'

" coding
Plug 'romainl/vim-qf'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'sbdchd/neoformat'

Plug 'mbbill/undotree'

"" infra
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'

"" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'skanehira/preview-markdown.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

"" latex
Plug 'lervag/vimtex'

"" python
Plug 'heavenshell/vim-pydocstring'
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'

"" utilities
Plug 'azadkuh/vim-cmus'
Plug 'voldikss/vim-floaterm'
Plug 'preservim/vimux'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" ---------- end plugins installation ---------- #


" ---------- nvim basic configuration ---------- #

let g:python_host_prog = '/usr/local/bin/python3'
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
  set background=dark
endif
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#whitespace#enabled = 0

set nocompatible

" basic options
set history=10000
set modeline
set modelines=5     " Debian likes to disable this
set backspace=indent,eol,start

set undodir=~/.config/nvim/undodir
set undofile
set noswapfile
set autoread

" clipboard
set clipboard=unnamed
nmap <C-p> :set paste!<CR>

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

" show quotes
set conceallevel=0

" json
let g:indentLine_conceallevel = 0

" default split
set splitright
set splitbelow

" enhance command line completion
set wildmenu

" ignore some files
set wildignore+=.idea

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

" load skeletons
augroup skeletons
  au!
  au BufNewFile * :silent! exec ":0r ~/.config/nvim/skeletons/skeleton.".expand('%:e')
augroup END


" others options
syntax enable
set relativenumber
set numberwidth=5
set colorcolumn=80
set showcmd
set laststatus=2

set fo=cqt
set fdm=marker
set ruler

" automatically change window's cwd to file's dir
" set autochdir

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
" keep terminal cursor
set guicursor=
set lazyredraw

" when editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
  \ endif

" ---------- end global options ---------- #


" ---------- mappings ---------- #

" leader key
let mapleader = ","

" ## globals ##

" change visual block mode with , + e (next, I, type your char, esc)
nnoremap <leader>e <C-v>

" <ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <leader>l :nohl<CR><C-l>

" plugins shortcuts
nnoremap <leader>n :CocCommand explorer<cr>
nnoremap <leader>c :TagbarToggle<CR>

" limelight
nnoremap <leader>l :Limelight!!<CR>

" source vimrc file
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
nnoremap ;r :edit ~/.config/nvim/init.vim<CR>

" undotree
noremap <leader>u :UndotreeShow<CR>

" files search
nnoremap <silent> fa :AnsibleFiles<CR>
nnoremap <silent> ff :WorkFiles<CR>
nnoremap <silent> fg :GitlabFiles<CR>

" make
nnoremap <silent>mk :!make pdf<CR>

" ripgrep
noremap <silent>rg :Rg<Space>

" goyo
nnoremap <silent> go :Goyo 95%x95%<CR>

" trim whitespace
nnoremap ;t :call TrimWhitespace()<CR>

nnoremap ;ap <Plug>(ale_previous_wrap)
nnoremap ;an <Plug>(ale_next_wrap)

" toggle mouse mode
nnoremap ;m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>

" coding
"" redo
nnoremap U <C-R>

"" back word with Shift + w
nnoremap <S-w> b

"" Jump up with Shift + x
nnoremap <S-x> {

"" Jump down with x
nnoremap x }

"" Remove square brackets content with ,cs
nnoremap ,cs ci[

"" Remove brackets content with ,cb
nnoremap ,cb ci{

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
let g:tex_flavor = 'latex'

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
nnoremap te <Esc>:tabnew<CR>
nnoremap tn <Esc>:tabnext<CR>
nnoremap tp <Esc>:tabprevious<CR>
nnoremap tc <Esc>:tabclose<CR>
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
nnoremap gi :Magit<cr>
nnoremap gl :GV<cr>
nnoremap gs :Gina status<cr>
nnoremap gf :Gina pull<cr>
nnoremap gd :Gina diff<cr>
nnoremap ga :Gina add .<cr>
nnoremap gc :Gina commit <cr>
nnoremap gp :Gina push <cr>
nnoremap gv :Gina log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]%Creset" --decorate<cr>
nnoremap gb :GBranches<cr>
nnoremap gG :GGrep<CR>

" ## formating ##
nnoremap fj :%!jq '.'<CR>
nnoremap fn :%!js-beautify -j -s 2 -f -<CR>
nnoremap fp :Autopep8<CR>
" makes ascii art font
nmap <space>f :.!toilet -w 200 -f term -F border<CR>

" ## floaterm
nnoremap <silent> ,t :FloatermNew! cd %:p:h;clear<CR>
nnoremap <silent> ,p :VimuxOpenRunner<CR>
nnoremap <silent> ;p :VimuxRunLastCommand<CR>
nnoremap <silent> ,tg :FloatermNew! cd %:p:h;lazygit;exit<CR>
nnoremap <silent> ,f :Files<CR>
nnoremap <silent> ,b :Buffers<CR>
nnoremap bn :bprev<CR>
nnoremap bp :bnext<CR>
nnoremap <silent> ,m :Marks<CR>
nnoremap <silent> ,h :History<CR>
nnoremap <silent> ,c :Commit<CR>

" ---------- end mappings ---------- #


" ---------- functions and plugins params ---------- #

" ## functions ##

" trim White Space
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

"floaterm
let g:floaterm_autoclose = 2
hi FloatermBorder guibg=transparent guifg=grey

" plugins params
let g:twiggy_group_locals_by_slash = 0
let g:twiggy_local_branch_sort = 'mru'
let g:twiggy_remote_branch_sort = 'date'

" linters and formating

" yaml
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */hostvars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */group_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */tasks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */defaults/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */meta/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */handlers/*.yml set filetype=yaml.ansible

" use XHTML and CSS with :TOhtml
let use_xhtml=1
let html_use_css=1
let html_ignore_folding=1
let html_use_encoding="UTF-8"

" lua
let lua_version=5
let lua_subversion=1

" python
let g:autopep8_disable_show_diff=1
let python_highlight_builtins=1
let python_highlight_exceptions=1
let python_highlight_numbers=1
let python_highlight_space_errors=1
autocmd VimEnter *.py nested :TagbarOpen
au BufRead,BufNewFile *.py setlocal textwidth=80
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

" :Neoformat! + ale python
let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_try_formatprg = 1
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1
let g:ale_completion_enabled = 1
let b:ale_linters = {'python': ['mypy', 'flake8', 'pylint']}
let g:ale_python_black_options='--line-length=79'
let b:ale_fixers = {'python': ['autoflake',  'autopep8', 'black', 'isort'], 'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1

" gitlab
let g:fugitive_gitlab_domains = ['https://git.fr.clara.net']

" ruby
let ruby_operators=1
let g:rubycomplete_buffer_loading=1
let g:rubycomplete_classes_in_global=1
let g:rubycomplete_rails=1
let g:vimrubocop_keymap = 0

" rails
let g:rails_gnu_screen=1
let g:rails_mappings=1
let g:rails_syntax=1

" markdown plugin
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_folding_disabled = 1
let g:vmt_auto_update_on_save = 1
au BufRead,BufNewFile *.md setlocal textwidth=80

" check language
set spelllang=fr,en_us,en_gb
autocmd FileType mail set spell

" limelight
let g:limelight_conceal_ctermfg = 'blue'

" coc
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-git',
  \ 'coc-yank',
  \ 'coc-explorer',
  \ ]
imap <C-l> <Plug>(coc-snippets-expand)

function! AuCocNvimInit()
    if @% == '' || @% == '.'
      exe ':CocCommand explorer'
    endif
endfunction
autocmd User CocNvimInit call AuCocNvimInit()

" fzf
command! -bang AnsibleFiles call fzf#vim#files('~/work/ansible', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
command! -bang DockerFiles call fzf#vim#files('~/work/technique/docker', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
command! -bang WorkFiles call fzf#vim#files('~/work/', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
command! -bang GitlabFiles call fzf#vim#files('~/work/gitlab', {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -L -g"!{node_modules,vendor,.idea,.datas}/*"'
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_checkout_git_options = '--sort=-committerdate'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" superTab Completion
let g:SuperTabDefaultCompletionType = "context"

" trail whitespace when saving
autocmd BufWritePre * :call TrimWhitespace()

" ---------- end functions ---------- #
