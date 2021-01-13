-- ============================================================================
-- Neovim Configuration in Lua
-- ============================================================================

-- ============================================================================
-- Plugin Manager: vim-plug
-- ============================================================================

local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Theme
Plug('arcticicestudio/nord-vim')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')

-- Focus
Plug('junegunn/goyo.vim')
Plug('junegunn/limelight.vim')
Plug('szw/vim-maximizer')
Plug('kshenoy/vim-signature')

-- File explorer
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-tree/nvim-web-devicons')

-- Fuzzy finder
Plug('junegunn/fzf', { ['do'] = vim.fn['fzf#install'] })
Plug('junegunn/fzf.vim')
Plug('stsewd/fzf-checkout.vim')
Plug('nvim-telescope/telescope.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- Completion (simple et efficace)
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-buffer')        -- Complétion depuis le buffer
Plug('hrsh7th/cmp-path')          -- Complétion des chemins de fichiers
Plug('hrsh7th/cmp-cmdline')       -- Complétion en ligne de commande
Plug('L3MON4D3/LuaSnip')          -- Snippets
Plug('saadparwaiz1/cmp_luasnip')  -- Intégration snippets
Plug('rafamadriz/friendly-snippets') -- Collection de snippets

-- Legacy fallback
Plug('ervandew/supertab')
Plug('honza/vim-snippets')

-- Utilities
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('jremmen/vim-ripgrep')

-- Git
Plug('tpope/vim-fugitive')
Plug('airblade/vim-gitgutter')
Plug('lambdalisue/gina.vim')
Plug('jreybert/vimagit')
Plug('junegunn/gv.vim')
Plug('whiteinge/diffconflicts')
Plug('shumphrey/fugitive-gitlab.vim')
Plug('lewis6991/gitsigns.nvim')
Plug('akinsho/git-conflict.nvim')  -- Résolution de conflits Git
Plug('NeogitOrg/neogit')           -- Interface Git moderne
Plug 'sindrets/diffview.nvim'

-- Syntax
Plug('jiangmiao/auto-pairs')
Plug('alvan/vim-closetag')
Plug('Yggdroot/indentLine')

-- Coding
Plug('romainl/vim-qf')
Plug('tpope/vim-commentary')
Plug('dense-analysis/ale')
Plug('sbdchd/neoformat')
Plug('editorconfig/editorconfig-vim')
Plug('mbbill/undotree')

-- Fold
Plug('tmhedberg/SimpylFold')
Plug('pedrohdz/vim-yaml-folds')
Plug('Konfekt/FastFold')

-- Infra
Plug('pearofducks/ansible-vim')
Plug('hashivim/vim-terraform')

-- Markdown
Plug('godlygeek/tabular')
Plug('plasticboy/vim-markdown')
Plug('skanehira/preview-markdown.vim')
Plug('vim-pandoc/vim-pandoc')
Plug('vim-pandoc/vim-pandoc-syntax')

-- LaTeX
Plug('lervag/vimtex')

-- Python
Plug('heavenshell/vim-pydocstring')
Plug('Vimjas/vim-python-pep8-indent')
Plug('jeetsukumaran/vim-pythonsense')

-- Treesitter (better syntax)
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- Terminal
Plug('voldikss/vim-floaterm')
Plug('preservim/vimux')

vim.call('plug#end')

-- ============================================================================
-- Basic Settings
-- ============================================================================

-- Python providers
vim.g.python_host_prog = '/usr/local/bin/python3'
vim.g.python3_host_prog = '/usr/local/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- General settings
vim.opt.compatible = false
vim.opt.history = 10000
vim.opt.modeline = true
vim.opt.modelines = 5
vim.opt.backspace = 'indent,eol,start'

-- Files
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.backup = false

-- Clipboard
vim.opt.clipboard = 'unnamed'

-- Performance
vim.opt.updatetime = 50
vim.opt.timeoutlen = 250
vim.opt.lazyredraw = true

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = 'utf-8,latin1,default'
vim.opt.fileformats = 'unix,dos,mac'

-- Formatting
vim.opt.shiftwidth = 2
vim.opt.textwidth = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.copyindent = true
vim.opt.smartindent = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5
vim.opt.colorcolumn = '120'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.cursorline = false
vim.opt.guicursor = ''
vim.opt.conceallevel = 0

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Completion
vim.opt.wildmenu = true
vim.opt.wildignore:append('.idea')
vim.opt.completeopt = 'longest,menu,preview'

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Scrolling
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 5
vim.opt.scrolljump = 1

-- Selection
vim.opt.selection = 'inclusive'
vim.opt.virtualedit = 'block'

-- Shell
vim.opt.shell = '/bin/zsh'

-- Syntax
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- ============================================================================
-- Theme Configuration
-- ============================================================================

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd('colorscheme nord')
vim.cmd [[
  highlight DiffAdd           guifg=#a3be8c guibg=NONE gui=NONE ctermfg=Green  ctermbg=NONE cterm=NONE
  highlight DiffDelete        guifg=#bf616a guibg=NONE gui=NONE ctermfg=Red    ctermbg=NONE cterm=NONE
  highlight DiffChange        guifg=#ebcb8b guibg=NONE gui=NONE ctermfg=Yellow ctermbg=NONE cterm=NONE
  highlight DiffText          guifg=#88c0d0 guibg=NONE gui=NONE ctermfg=Cyan   ctermbg=NONE cterm=NONE

  highlight NeogitDiffAdd             guifg=#a3be8c guibg=NONE gui=NONE
  highlight NeogitDiffAddHighlight    guifg=#a3be8c guibg=NONE gui=NONE
  highlight NeogitDiffDelete          guifg=#bf616a guibg=NONE gui=NONE
  highlight NeogitDiffDeleteHighlight guifg=#bf616a guibg=NONE gui=NONE
  highlight NeogitDiffContext         guifg=#d8dee9 guibg=NONE gui=NONE
  highlight NeogitDiffContextHighlight guifg=#d8dee9 guibg=NONE gui=NONE
  highlight NeogitHunkHeader          guifg=#81a1c1 guibg=NONE gui=NONE
  highlight NeogitHunkHeaderHighlight guifg=#81a1c1 guibg=NONE gui=NONE
]]
vim.opt.fillchars:append('eob:.')
vim.cmd('highlight EndOfBuffer ctermfg=0 guifg=#000000')

-- Airline
vim.g.airline_theme = 'minimalist'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#show_buffers'] = 0
vim.g['airline#extensions#tabline#show_tabs'] = 1
vim.g['airline#extensions#tabline#fnamemod'] = ':t'
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#hunks#enabled'] = 1
vim.g['airline#extensions#hunks#non_zero_only'] = 1
vim.g['airline#extensions#whitespace#enabled'] = 0
vim.g['airline#extensions#ale#enabled'] = 1

-- ============================================================================
-- Filetype Settings
-- ============================================================================

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  command = 'setlocal shiftwidth=4 softtabstop=4 expandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'bash',
  command = 'setlocal shiftwidth=2 softtabstop=2 expandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  command = 'setlocal shiftwidth=8 tabstop=8 noexpandtab'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.textwidth = 120
    vim.opt_local.colorcolumn = '120'
    vim.opt_local.foldmethod = 'indent'
    vim.opt_local.foldlevel = 99

    -- Python specific keymaps (buffer local)
    local buf_opts = { noremap = true, silent = true, buffer = true }

    -- Quick run
    vim.keymap.set('n', '<F5>', ':!python3 %<CR>', buf_opts)
    vim.keymap.set('n', '<F6>', ':!pytest %<CR>', buf_opts)

    -- Breakpoint insertion
    vim.keymap.set('n', '<leader>pb', 'oimport pdb; pdb.set_trace()<Esc>', buf_opts)
    vim.keymap.set('n', '<leader>pB', 'Oimport pdb; pdb.set_trace()<Esc>', buf_opts)

    -- Import sorting (if isort is installed)
    vim.keymap.set('n', '<leader>ps', ':!isort %<CR>', buf_opts)

    -- Virtual environment info
    vim.keymap.set('n', '<leader>pv', ':!python3 --version && which python3<CR>', buf_opts)
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'ruby', 'yaml', 'terraform', 'tf', 'html', 'css', 'javascript', 'json', 'jsonnet', 'helm'},
  command = 'setlocal shiftwidth=2 softtabstop=2 expandtab tabstop=2'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'json',
  command = 'setlocal foldmethod=syntax'
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  command = 'setlocal textwidth=80'
})

-- Ansible YAML detection
local ansible_patterns = {
  '*/playbooks/*.yml',
  '*/hostvars/*.yml',
  '*/group_vars/*.yml',
  '*/tasks/*.yml',
  '*/defaults/*.yml',
  '*/vars/*.yml',
  '*/meta/*.yml',
  '*/handlers/*.yml'
}

for _, pattern in ipairs(ansible_patterns) do
  vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = pattern,
    command = 'set filetype=yaml.ansible'
  })
end

-- ============================================================================
-- Key Mappings
-- ============================================================================

-- Leader key
vim.g.mapleader = ','

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Visual block mode
map('n', '<leader>e', '<C-v>', opts)

-- Clear search highlighting
map('n', '<leader>l', ':nohl<CR><C-l>', opts)

-- Plugins
map('n', '<leader>c', ':TagbarToggle<CR>', opts)
map('n', '<leader>l', ':Limelight!!<CR>', opts)

-- Config
map('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>', opts)
map('n', ';r', ':edit ~/.config/nvim/init.lua<CR>', opts)

-- Undotree
map('n', '<leader>u', ':UndotreeShow<CR>', opts)

-- Files search
map('n', 'fa', ':AnsibleFiles<CR>', opts)
map('n', 'ff', ':WorkFiles<CR>', opts)
map('n', 'fg', ':GitlabFiles<CR>', opts)

-- Ripgrep
map('n', 'rg', ':Rg ', { noremap = true })

-- Goyo
map('n', 'go', ':Goyo 95%x95%<CR>', opts)

-- ALE navigation
map('n', ';ap', '<Plug>(ale_previous_wrap)', opts)
map('n', ';an', '<Plug>(ale_next_wrap)', opts)

-- Toggle mouse
map('n', ';m', '<ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>', opts)

-- Coding shortcuts
map('n', 'U', '<C-R>', opts)
map('n', '<S-w>', 'b', opts)
map('n', '<S-x>', '{', opts)
map('n', 'x', '}', opts)
map('n', ',cs', 'ci[', opts)
map('n', ',cb', 'ci{', opts)

-- Pane management
map('n', 'pv', '<C-w>v<C-w>l', opts)
map('n', 'ph', ':split<CR>', opts)
map('n', 'pr', '<C-w>r', opts)
map('n', 'ps', '<c-w>j', opts)
map('n', 'pz', '<c-w>k', opts)
map('n', 'pd', '<c-w>l', opts)
map('n', 'pq', '<c-w>h', opts)

-- Maximize pane
map('n', ',z', ':MaximizerToggle<CR>', opts)
map('v', ',z', ':MaximizerToggle<CR>gv', opts)
map('i', ',z', '<C-o>:MaximizerToggle<CR>', opts)

-- Tab management
map('n', 'te', '<Esc>:tabnew<CR>', opts)
map('n', 'tn', '<Esc>:tabnext<CR>', opts)
map('n', 'tp', '<Esc>:tabprevious<CR>', opts)
map('n', 'tc', '<Esc>:tabclose<CR>', opts)
map('n', 'tf', '<Esc>:tabfirst<CR>', opts)
map('n', 'tl', '<Esc>:tablast<CR>', opts)
map('n', 'tm', '<Esc>:tabm', { noremap = true })

-- Git
map('n', 'gi', ':Magit<cr>', opts)
map('n', 'gl', ':GV<cr>', opts)
map('n', 'gs', ':Gina status<cr>', opts)
map('n', 'gf', ':Gina pull<cr>', opts)
map('n', 'gd', ':Gina diff<cr>', opts)
map('n', 'ga', ':Gina add .<cr>', opts)
map('n', 'gc', ':Gina commit<cr>', opts)
map('n', 'gp', ':Gina push<cr>', opts)
map('n', 'gb', ':GBranches<cr>', opts)
map('n', 'gG', ':GGrep<CR>', opts)

-- Formatting
map('n', 'fj', ':%!jq \'.\'<CR>', opts)
map('n', 'fn', ':%!js-beautify -j -s 2 -f -<CR>', opts)

-- Floaterm
map('n', ',t', ':FloatermNew! cd "%:p:h" ; clear<CR>', opts)
map('n', ',p', ':VimuxOpenRunner<CR>', opts)
map('n', ';p', ':VimuxRunLastCommand<CR>', opts)
map('n', ',tg', ':FloatermNew! cd "%:p:h";lazygit;exit<CR>', opts)
map('n', ',td', ':FloatermNew! lazydocker;exit<CR>', opts)
map('n', ',f', ':Files<CR>', opts)
map('n', ',b', ':Buffers<CR>', opts)
map('n', 'bn', ':bprev<CR>', opts)
map('n', 'bp', ':bnext<CR>', opts)
map('n', ',m', ':Marks<CR>', opts)
map('n', ',h', ':History<CR>', opts)

-- Shortcuts help
map('n', ',?', ':vsplit ~/.config/nvim/shortcuts.md<CR>', opts)

-- Markdown preview
map('n', ',md', ':PreviewMarkdown<CR>', opts)

-- Python specific mappings
map('n', '<leader>pd', ':Pydocstring<CR>', opts)  -- Generate docstring
map('n', '<leader>pr', ':!python3 %<CR>', opts)   -- Run current file
map('n', '<leader>pi', ':!python3 -i %<CR>', opts) -- Run in interactive mode
map('n', '<leader>pt', ':!pytest %<CR>', opts)    -- Run pytest on current file
map('n', '<leader>pa', ':!pytest<CR>', opts)      -- Run all tests
map('n', '<leader>pc', ':!python3 -m py_compile %<CR>', opts) -- Check syntax

-- Paste toggle
map('n', '<C-p>', ':set paste!<CR>', opts)

-- ============================================================================
-- Functions
-- ============================================================================

-- Trim whitespace
function TrimWhitespace()
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

-- Auto trim on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = TrimWhitespace
})

-- Update folds for Python
function UpdateFolds()
  vim.fn['SimpylFold#Recache']()
  vim.cmd('FastFoldUpdate!')
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.py',
  callback = UpdateFolds
})

-- Jump to last position
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line('$') then
      vim.cmd('normal! g`"')
    end
  end
})

-- Auto open TagBar for Python
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*.py',
  nested = true,
  command = 'TagbarOpen'
})

-- Load skeletons
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*',
  callback = function()
    local ext = vim.fn.expand('%:e')
    local skeleton = vim.fn.expand('~/.config/nvim/skeletons/skeleton.' .. ext)
    if vim.fn.filereadable(skeleton) == 1 then
      vim.cmd('silent! 0r ' .. skeleton)
    end
  end
})

-- ============================================================================
-- Plugin Configuration
-- ============================================================================

-- Floaterm
vim.g.floaterm_autoclose = 2

-- SuperTab
vim.g.SuperTabDefaultCompletionType = 'context'

-- IndentLine
vim.g.indentLine_conceallevel = 0

-- Limelight
vim.g.limelight_conceal_ctermfg = 'blue'

-- Markdown
vim.g.preview_markdown_parser = 'glow'
vim.g.preview_markdown_vertical = 1
vim.g.vim_markdown_conceal = 0
vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_edit_url_in = 'tab'
vim.g.vim_markdown_fenced_languages = {
  'ini=dosini', 'shell=sh', 'yml=yaml', 'python=python',
  'bash=sh', 'go=go', 'rust=rust', 'javascript=javascript', 'json=json'
}
vim.g.vim_markdown_folding_style_pythonic = 1
vim.g.vim_markdown_follow_anchor = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_toc_autofit = 1
vim.g.vmt_auto_update_on_save = 1

-- LaTeX
vim.g.tex_flavor = 'latex'

-- Python highlighting
vim.g.python_highlight_builtins = 1
vim.g.python_highlight_exceptions = 1
vim.g.python_highlight_numbers = 1
vim.g.python_highlight_space_errors = 1
vim.g.python_highlight_string_formatting = 1
vim.g.python_highlight_string_format = 1
vim.g.python_highlight_string_templates = 1
vim.g.python_highlight_indent_errors = 1
vim.g.python_highlight_class_vars = 1
vim.g.python_highlight_operators = 1
vim.g.python_highlight_all = 1

-- Python docstring
vim.g.pydocstring_formatter = 'google'
vim.g.pydocstring_doq_path = 'doq'
vim.g.pydocstring_enable_mapping = 0

-- Python sense (text objects)
vim.g.is_pythonsense_suppress_motion_keymaps = 0
vim.g.is_pythonsense_suppress_object_keymaps = 0
vim.g.is_pythonsense_alternate_motion_keymaps = 0

-- Ruff configuration
vim.g.ale_python_ruff_executable = 'ruff'
vim.g.ale_python_ruff_options = '--line-length 120'
vim.g.ale_python_ruff_format_options = '--line-length 120'
vim.g.ale_python_ruff_auto_pipenv = 1
vim.g.ale_python_ruff_auto_poetry = 1

-- ALE configuration
vim.g.ale_completion_enabled = 1
vim.g.ale_linters = {
  python = {'ruff'},
  yaml = {'yamllint'},
  rust = {'analyzer'},
  markdown = {'markdownlint'},
  gitcommit = {'commitlint'}
}
vim.g.ale_linters_ignore = {
  terraform = {'terraform'}
}
vim.g.ale_fixers = {
  python = {'ruff', 'ruff_format'},
  javascript = {'prettier', 'eslint'},
  rego = {'opafmt', 'remove_trailing_lines', 'trim_whitespace'},
  rust = {'remove_trailing_lines', 'rustfmt', 'trim_whitespace'},
  terraform = {'remove_trailing_lines', 'terraform'},
  yaml = {'remove_trailing_lines', 'trim_whitespace'},
  markdown = {'prettier', 'remove_trailing_lines', 'trim_whitespace'}
}
vim.g.ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: disable}}"'
vim.g.ale_markdown_markdownlint_options = '--config ~/.markdownlint.json'
vim.g.ale_echo_msg_error_str = 'E'
vim.g.ale_echo_msg_warning_str = 'W'
vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_fix_on_save = 1

-- Go
vim.g.go_fmt_autosave = 1
vim.g.go_fmt_command = 'goimports'
vim.g.go_fmt_fail_silently = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_methods = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_types = 1
vim.g.go_list_type = 'quickfix'

-- Rust
vim.g.rust_fold = 1
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_fail_silently = 1

-- Ruby
vim.g.ruby_operators = 1
vim.g.rubycomplete_buffer_loading = 1
vim.g.rubycomplete_classes_in_global = 1
vim.g.rubycomplete_rails = 1
vim.g.vimrubocop_keymap = 0

-- Rails
vim.g.rails_gnu_screen = 1
vim.g.rails_mappings = 1
vim.g.rails_syntax = 1

-- Terraform
vim.g.terraform_align = 0
vim.g.terraform_fold_sections = 1
vim.g.terraform_fmt_on_save = 0

-- GitLab
vim.g.fugitive_gitlab_domains = {'https://git.fr.clara.net'}

-- Spell checking
vim.opt.spelllang = 'fr,en_us,en_gb'
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'mail',
  command = 'set spell'
})

-- FZF
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --ignore-case --hidden -L -g"!{node_modules,vendor,.idea,.datas}/*"'
vim.env.FZF_DEFAULT_OPTS = "--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
vim.g.fzf_layout = { window = { width = 0.9, height = 0.9 } }
vim.g.fzf_checkout_git_options = '--sort=-committerdate'
vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

-- FZF commands
vim.cmd([[
command! -bang AnsibleFiles call fzf#vim#files('~/work/ansible', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
command! -bang WorkFiles call fzf#vim#files('~/work/', {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,grid --line-range :300 {}']}, <bang>0)
command! -bang GitlabFiles call fzf#vim#files('~/work/gitlab', {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
]])

-- ============================================================================
-- Lua Plugin Configuration
-- ============================================================================

-- Disable netrw (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- NvimTree (optional - only load if installed)
local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if nvimtree_ok then
  nvimtree.setup({
    sort = {
      sorter = 'case_sensitive',
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
      custom = { '.git$' },
    },
  })

  -- Auto open nvim-tree if no file specified
  vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
      if vim.fn.argc() == 0 then
        require('nvim-tree.api').tree.open()
      end
    end
  })
end

-- Transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

-- Gitsigns (optional - only load if installed)
local gitsigns_ok, gitsigns = pcall(require, 'gitsigns')
if gitsigns_ok then
  gitsigns.setup({
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    current_line_blame = false,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map_git(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation
      map_git('n', ']h', gs.next_hunk, 'Next Hunk')
      map_git('n', '[h', gs.prev_hunk, 'Previous Hunk')

      -- Actions
      map_git('n', '<leader>hs', gs.stage_hunk, 'Stage Hunk')
      map_git('n', '<leader>hr', gs.reset_hunk, 'Reset Hunk')
      map_git('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
      map_git('n', '<leader>hb', function() gs.blame_line{full=true} end, 'Blame Line')
    end
  })
end

-- Treesitter (optional - only load if installed)
local treesitter_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if treesitter_ok then
  treesitter.setup({
    ensure_installed = {
      'python', 'lua', 'vim', 'vimdoc', 'bash', 'json', 'yaml',
      'markdown', 'markdown_inline', 'go', 'rust', 'javascript',
      'typescript', 'html', 'css', 'terraform', 'hcl', 'toml'
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  })
end

-- Telescope (optional - only load if installed)
local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
  telescope.setup({
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "truncate" },
      mappings = {
        i = {
          ['<C-j>'] = require('telescope.actions').move_selection_next,
          ['<C-k>'] = require('telescope.actions').move_selection_previous,
        },
      },
      file_ignore_patterns = {
        "node_modules",
        ".git/",
        "*.pyc",
        "__pycache__",
        ".venv",
        "venv",
        "*.egg-info",
        ".pytest_cache",
        ".mypy_cache",
        ".ruff_cache",
      },
    },
  })

  -- Load fzf extension if available
  pcall(telescope.load_extension, 'fzf')

  -- Telescope keybindings
  local builtin_ok, builtin = pcall(require, 'telescope.builtin')
  if builtin_ok then
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Recent Files' })
    vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Commands' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Grep String' })
  end
end

-- Nvim-cmp (autocompletion)
local cmp_ok, cmp = pcall(require, 'cmp')
if cmp_ok then
  local luasnip_ok, luasnip = pcall(require, 'luasnip')

  -- Load friendly-snippets
  if luasnip_ok then
    require('luasnip.loaders.from_vscode').lazy_load()
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        if luasnip_ok then
          luasnip.lsp_expand(args.body)
        end
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip_ok and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip_ok and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'luasnip', priority = 100 },
      { name = 'buffer', priority = 80, keyword_length = 3 },
      { name = 'path', priority = 60 },
    }),
    formatting = {
      format = function(entry, vim_item)
        vim_item.menu = ({
          luasnip = '[Snip]',
          buffer = '[Buf]',
          path = '[Path]',
        })[entry.source.name]
        return vim_item
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    experimental = {
      ghost_text = true,
    },
  })

  -- Cmdline completion for '/'
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Cmdline completion for ':'
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline', keyword_length = 2 }
    })
  })
end

-- Git Conflict
local gitconflict_ok, gitconflict = pcall(require, 'git-conflict')
if gitconflict_ok then
  gitconflict.setup({
    default_mappings = true,
    default_commands = true,
    disable_diagnostics = false,
    highlights = {
      incoming = 'DiffAdd',
      current = 'DiffText',
    }
  })

  -- Raccourcis pour résoudre les conflits
  vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)', { desc = 'Garder notre version' })
  vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)', { desc = 'Garder leur version' })
  vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)', { desc = 'Garder les deux' })
  vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)', { desc = 'Supprimer les deux' })
  vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)', { desc = 'Conflit précédent' })
  vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)', { desc = 'Conflit suivant' })
end

-- Neogit (modern Git interface)
local neogit_ok, neogit = pcall(require, 'neogit')
if neogit_ok then
  neogit.setup({
    commit_editor = {
      kind = "vsplit",
      show_staged_diff = true,
    },
    console_timeout = 5000,
    auto_show_console = false,
    kind = "tab",
    signs = {
      section = { "", "" },
      item = { "", "" },
      hunk = { "", "" },
    },
    integrations = {
      telescope = true,
      diffview = true,
    },
  })

  -- Neogit keymaps
  vim.keymap.set('n', '<leader>gg', ':Neogit<CR>', { desc = 'Ouvrir Neogit', silent = true })
  vim.keymap.set('n', '<leader>gC', ':Neogit commit<CR>', { desc = 'Commit avec Neogit', silent = true })
  vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { desc = 'Push avec Neogit', silent = true })
  vim.keymap.set('n', '<leader>gL', ':Neogit log<CR>', { desc = 'Log avec Neogit', silent = true })
end

-- ============================================================================
-- End of Configuration
-- ============================================================================
