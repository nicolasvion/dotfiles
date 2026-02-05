-- ============================================================================
-- Keymaps
-- ============================================================================

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ============================================================================
-- General Keymaps
-- ============================================================================

-- Visual block mode
map('n', '<leader>e', '<C-v>', opts)

-- Clear search highlighting
map('n', '<leader>l', ':nohl<CR><C-l>', opts)

-- Toggle mouse
map('n', ';m', '<ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>', opts)

-- Paste toggle
map('n', '<C-p>', ':set paste!<CR>', opts)

-- ============================================================================
-- Config Shortcuts
-- ============================================================================

map('n', '<leader>r', ':source ~/.config/nvim/init.lua<CR>', opts)
map('n', ';r', ':edit ~/.config/nvim/init.lua<CR>', opts)
map('n', ',?', ':vsplit ~/.config/nvim/shortcuts.md<CR>', opts)

-- ============================================================================
-- Coding Shortcuts
-- ============================================================================

map('n', 'U', '<C-R>', opts)
-- map('n', '<S-w>', 'b', opts)
map('n', '<S-x>', '{', opts)
map('n', 'x', '}', opts)
map('n', ',cs', 'ci[', opts)
map('n', ',cb', 'ci{', opts)

-- ============================================================================
-- Pane Management
-- ============================================================================

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

-- ============================================================================
-- Tab Management
-- ============================================================================

map('n', 'te', '<Esc>:tabnew<CR>', opts)
map('n', 'tn', '<Esc>:tabnext<CR>', opts)
map('n', 'tp', '<Esc>:tabprevious<CR>', opts)
map('n', 'tc', '<Esc>:tabclose<CR>', opts)
map('n', 'tf', '<Esc>:tabfirst<CR>', opts)
map('n', 'tl', '<Esc>:tablast<CR>', opts)
map('n', 'tm', '<Esc>:tabm', { noremap = true })

-- ============================================================================
-- Buffer Management
-- ============================================================================

map('n', ',b', ':Buffers<CR>', opts)
map('n', 'bn', ':bprev<CR>', opts)
map('n', 'bp', ':bnext<CR>', opts)

-- ============================================================================
-- File Navigation
-- ============================================================================

-- Files search
map('n', 'fa', ':AnsibleFiles<CR>', opts)
map('n', 'ff', ':WorkFiles<CR>', opts)
map('n', 'fg', ':GitlabFiles<CR>', opts)
map('n', ',f', ':Files<CR>', opts)
map('n', ',m', ':Marks<CR>', opts)
map('n', ',h', ':History<CR>', opts)

-- Ripgrep
map('n', 'rg', ':Rg ', { noremap = true })

-- ============================================================================
-- Plugin Shortcuts
-- ============================================================================

-- Tagbar
map('n', '<leader>c', ':TagbarToggle<CR>', opts)

-- Limelight
map('n', '<leader>l', ':Limelight!!<CR>', opts)

-- Undotree
map('n', '<leader>u', ':UndotreeShow<CR>', opts)

-- Goyo
map('n', 'go', ':Goyo 95%x95%<CR>', opts)

-- ALE navigation
map('n', ';ap', '<Plug>(ale_previous_wrap)', opts)
map('n', ';an', '<Plug>(ale_next_wrap)', opts)

-- ============================================================================
-- Git Shortcuts
-- ============================================================================

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

-- ============================================================================
-- Formatting
-- ============================================================================

map('n', 'fj', ':%!jq \'.\'<CR>', opts)
map('n', 'fn', ':%!js-beautify -j -s 2 -f -<CR>', opts)

-- ============================================================================
-- Terminal (Floaterm & Vimux)
-- ============================================================================

map('n', ',t', ':FloatermNew! cd "%:p:h" ; clear<CR>', opts)
map('n', ',p', ':VimuxOpenRunner<CR>', opts)
map('n', ';p', ':VimuxRunLastCommand<CR>', opts)
map('n', ',tg', ':FloatermNew! cd "%:p:h";lazygit;exit<CR>', opts)
map('n', ',td', ':FloatermNew! lazydocker;exit<CR>', opts)

-- ============================================================================
-- Markdown
-- ============================================================================

map('n', ',md', ':PreviewMarkdown<CR>', opts)

-- ============================================================================
-- Python Specific Mappings
-- ============================================================================

map('n', '<leader>pd', ':Pydocstring<CR>', opts)
map('n', '<leader>pr', ':!python3 %<CR>', opts)
map('n', '<leader>pi', ':!python3 -i %<CR>', opts)
map('n', '<leader>pt', ':!pytest %<CR>', opts)
map('n', '<leader>pa', ':!pytest<CR>', opts)
map('n', '<leader>pc', ':!python3 -m py_compile %<CR>', opts)

-- ============================================================================
-- End of Keymaps
-- ============================================================================
