-- ============================================================================
-- Neovim Options
-- ============================================================================

local opt = vim.opt
local g = vim.g

-- ============================================================================
-- Python Providers
-- ============================================================================

g.python_host_prog = '/usr/local/bin/python3'
g.python3_host_prog = '/usr/local/bin/python3'
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0

-- Disable netrw (for nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- ============================================================================
-- General Settings
-- ============================================================================

opt.compatible = false
opt.history = 10000
opt.modeline = true
opt.modelines = 5
opt.backspace = 'indent,eol,start'

-- ============================================================================
-- Files
-- ============================================================================

opt.undodir = vim.fn.expand('~/.config/nvim/undodir')
opt.undofile = true
opt.swapfile = false
opt.autoread = true
opt.backup = false

-- ============================================================================
-- Clipboard
-- ============================================================================

opt.clipboard = 'unnamed'

-- ============================================================================
-- Performance
-- ============================================================================

opt.updatetime = 50
opt.timeoutlen = 250
opt.lazyredraw = true

-- ============================================================================
-- Encoding
-- ============================================================================

opt.encoding = 'utf-8'
opt.fileencodings = 'utf-8,latin1,default'
opt.fileformats = 'unix,dos,mac'

-- ============================================================================
-- Formatting
-- ============================================================================

opt.shiftwidth = 2
opt.textwidth = 0
opt.expandtab = true
opt.smarttab = true
opt.copyindent = true
opt.smartindent = true

-- ============================================================================
-- UI
-- ============================================================================

opt.number = true
opt.relativenumber = true
opt.numberwidth = 5
opt.colorcolumn = '120'
opt.showcmd = true
opt.laststatus = 2
opt.ruler = true
opt.cursorline = false
opt.guicursor = ''
opt.conceallevel = 0
opt.termguicolors = true
opt.background = 'dark'

-- ============================================================================
-- Splits
-- ============================================================================

opt.splitright = true
opt.splitbelow = true

-- ============================================================================
-- Completion
-- ============================================================================

opt.wildmenu = true
opt.wildignore:append('.idea')
opt.completeopt = 'menu,menuone,noselect'

-- ============================================================================
-- Search
-- ============================================================================

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- ============================================================================
-- Scrolling
-- ============================================================================

opt.scrolloff = 3
opt.sidescrolloff = 5
opt.scrolljump = 1

-- ============================================================================
-- Selection
-- ============================================================================

opt.selection = 'inclusive'
opt.virtualedit = 'block'

-- ============================================================================
-- Shell
-- ============================================================================

opt.shell = '/bin/zsh'

-- ============================================================================
-- Syntax
-- ============================================================================

vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- ============================================================================
-- Spell Checking
-- ============================================================================

opt.spelllang = 'fr,en_us,en_gb'

-- ============================================================================
-- Plugin-specific Global Variables
-- ============================================================================

-- Python highlighting
g.python_highlight_builtins = 1
g.python_highlight_exceptions = 1
g.python_highlight_numbers = 1
g.python_highlight_space_errors = 1
g.python_highlight_string_formatting = 1
g.python_highlight_string_format = 1
g.python_highlight_string_templates = 1
g.python_highlight_indent_errors = 1
g.python_highlight_class_vars = 1
g.python_highlight_operators = 1
g.python_highlight_all = 1

-- Go
g.go_fmt_autosave = 1
g.go_fmt_command = 'goimports'
g.go_fmt_fail_silently = 1
g.go_highlight_build_constraints = 1
g.go_highlight_fields = 1
g.go_highlight_function_calls = 1
g.go_highlight_functions = 1
g.go_highlight_methods = 1
g.go_highlight_operators = 1
g.go_highlight_types = 1
g.go_list_type = 'quickfix'

-- Rust
g.rust_fold = 1
g.rustfmt_autosave = 1
g.rustfmt_fail_silently = 1

-- Ruby
g.ruby_operators = 1
g.rubycomplete_buffer_loading = 1
g.rubycomplete_classes_in_global = 1
g.rubycomplete_rails = 1
g.vimrubocop_keymap = 0

-- Rails
g.rails_gnu_screen = 1
g.rails_mappings = 1
g.rails_syntax = 1

-- SuperTab
g.SuperTabDefaultCompletionType = 'context'

-- ============================================================================
-- End of Options
-- ============================================================================
