-- ============================================================================
-- UI Plugins
-- ============================================================================

return {
  -- Note: Each plugin spec is a direct entry in this table
  -- ============================================================================
  -- Theme
  -- ============================================================================
  {
    'arcticicestudio/nord-vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd('colorscheme nord')

      -- Custom highlights
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

      -- Transparent background
      vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
      vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
    end,
  },

  -- ============================================================================
  -- Statusline
  -- ============================================================================
  {
    'vim-airline/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
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
    end,
  },

  -- ============================================================================
  -- Focus & Zen Mode
  -- ============================================================================
  {
    'junegunn/goyo.vim',
    cmd = 'Goyo',
  },

  {
    'junegunn/limelight.vim',
    cmd = 'Limelight',
    config = function()
      vim.g.limelight_conceal_ctermfg = 'blue'
    end,
  },

  {
    'szw/vim-maximizer',
    keys = ',z',
  },

  -- ============================================================================
  -- Visual Helpers
  -- ============================================================================
  {
    'kshenoy/vim-signature',  -- Display marks
  },

  {
    'Yggdroot/indentLine',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.indentLine_conceallevel = 0
    end,
  },

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    config = function()
      local opts = { noremap = true, silent = true }
      -- Move to previous/next
      vim.keymap.set("n", "<leader><", ":BufferPrevious<CR>", opts)
      vim.keymap.set("n", "<leader>>", ":BufferNext<CR>", opts)
      vim.keymap.set("n", "<leader>b", ":BufferPick<CR>", opts )

      -- Remap :q to close buffer instead of window for normal files
      vim.api.nvim_create_user_command('Q', function()
        local current_buf = vim.api.nvim_get_current_buf()
        local buftype = vim.api.nvim_buf_get_option(current_buf, 'buftype')
        local filetype = vim.api.nvim_buf_get_option(current_buf, 'filetype')

        -- For normal buffers, close buffer but keep window
        if buftype == '' and filetype ~= 'NvimTree' then
          -- Get all normal buffers (excluding current)
          local buffers = vim.fn.getbufinfo({ buflisted = 1 })
          local has_other_buffer = false

          for _, buf in ipairs(buffers) do
            local bt = vim.api.nvim_buf_get_option(buf.bufnr, 'buftype')
            local ft = vim.api.nvim_buf_get_option(buf.bufnr, 'filetype')
            if bt == '' and ft ~= 'NvimTree' and buf.bufnr ~= current_buf then
              has_other_buffer = true
              break
            end
          end

          -- If there are other buffers, navigate then delete current buffer
          if has_other_buffer then
            pcall(vim.cmd, 'BufferPrevious')
            -- If still on same buffer, try next
            if vim.api.nvim_get_current_buf() == current_buf then
              pcall(vim.cmd, 'BufferNext')
            end
            -- Delete the original buffer
            pcall(vim.api.nvim_buf_delete, current_buf, { force = false })
          else
            -- Last buffer, quit all (close Neovim completely)
            vim.cmd('qall')
          end
        else
          -- For special buffers, normal quit
          vim.cmd('quit')
        end
      end, {})

      -- Map :q to custom Q command
      vim.keymap.set('c', 'q<CR>', '<C-u>Q<CR>', { noremap = true, silent = false })
      vim.keymap.set('c', 'q!<CR>', '<C-u>quit!<CR>', { noremap = true, silent = false })
    end,
  },
}
