-- ============================================================================
-- Autocommands
-- ============================================================================

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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'mail',
  command = 'set spell'
})

-- ============================================================================
-- Ansible YAML Detection
-- ============================================================================

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
-- Utility Functions
-- ============================================================================

-- Trim whitespace on save
local function trim_whitespace()
  local save = vim.fn.winsaveview()
  vim.cmd([[keeppatterns %s/\s\+$//e]])
  vim.fn.winrestview(save)
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = trim_whitespace
})

-- Update folds for Python
local function update_folds()
  vim.fn['SimpylFold#Recache']()
  vim.cmd('FastFoldUpdate!')
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.py',
  callback = update_folds
})

-- ============================================================================
-- Jump to Last Position
-- ============================================================================

vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*',
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 0 and line <= vim.fn.line('$') then
      vim.cmd('normal! g`"')
    end
  end
})

-- ============================================================================
-- Auto Open TagBar for Python
-- ============================================================================

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*.py',
  nested = true,
  command = 'TagbarToggle'
})

-- ============================================================================
-- Load Skeletons
-- ============================================================================

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
-- End of Autocommands
-- ============================================================================
