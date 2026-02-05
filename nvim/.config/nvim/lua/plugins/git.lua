-- ============================================================================
-- Git Plugins
-- ============================================================================

return {
  -- ============================================================================
  -- Git Core - Fugitive
  -- ============================================================================
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G', 'Gstatus', 'Gcommit' },
  },

  -- ============================================================================
  -- GitLab Integration
  -- ============================================================================
  {
    'shumphrey/fugitive-gitlab.vim',
    dependencies = { 'tpope/vim-fugitive' },
    config = function()
      vim.g.fugitive_gitlab_domains = {'https://git.fr.clara.net'}
    end,
  },

  -- ============================================================================
  -- Git Integration
  -- ============================================================================
  {
    'airblade/vim-gitgutter',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      vim.g.gitgutter_sign_added = '+'
      vim.g.gitgutter_sign_modified = '~'
      vim.g.gitgutter_sign_removed = '-'
    end,
  },

  -- ============================================================================
  -- Gitsigns (modern alternative)
  -- ============================================================================
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local ok, gitsigns = pcall(require, 'gitsigns')
      if not ok then
        return
      end

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

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
          end

          -- Navigation
          map('n', ']h', gs.next_hunk, 'Next Hunk')
          map('n', '[h', gs.prev_hunk, 'Previous Hunk')

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, 'Stage Hunk')
          map('n', '<leader>hr', gs.reset_hunk, 'Reset Hunk')
          map('n', '<leader>hp', gs.preview_hunk, 'Preview Hunk')
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, 'Blame Line')
        end
      })
    end,
  },

  -- ============================================================================
  -- Git Conflict Resolution
  -- ============================================================================
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    event = 'BufReadPre',
    config = function()
      local ok, git_conflict = pcall(require, 'git-conflict')
      if not ok then
        return
      end

      git_conflict.setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        }
      })

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>co', '<Plug>(git-conflict-ours)', vim.tbl_extend('force', opts, { desc = 'Garder notre version' }))
      vim.keymap.set('n', '<leader>ct', '<Plug>(git-conflict-theirs)', vim.tbl_extend('force', opts, { desc = 'Garder leur version' }))
      vim.keymap.set('n', '<leader>cb', '<Plug>(git-conflict-both)', vim.tbl_extend('force', opts, { desc = 'Garder les deux' }))
      vim.keymap.set('n', '<leader>c0', '<Plug>(git-conflict-none)', vim.tbl_extend('force', opts, { desc = 'Supprimer les deux' }))
      vim.keymap.set('n', '[x', '<Plug>(git-conflict-prev-conflict)', vim.tbl_extend('force', opts, { desc = 'Conflit précédent' }))
      vim.keymap.set('n', ']x', '<Plug>(git-conflict-next-conflict)', vim.tbl_extend('force', opts, { desc = 'Conflit suivant' }))
    end,
  },

  {
    'whiteinge/diffconflicts',
  },

  -- ============================================================================
  -- Git Interfaces
  -- ============================================================================
  {
    'lambdalisue/gina.vim',
    cmd = 'Gina',
  },

  {
    'jreybert/vimagit',
    cmd = 'Magit',
  },

  -- ============================================================================
  -- Git Log & History
  -- ============================================================================
  {
    'junegunn/gv.vim',
    cmd = 'GV',
  },

  -- ============================================================================
  -- Neogit (modern Git interface)
  -- ============================================================================
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Ouvrir Neogit' },
      { '<leader>gC', '<cmd>Neogit commit<cr>', desc = 'Commit avec Neogit' },
      { '<leader>gP', '<cmd>Neogit push<cr>', desc = 'Push avec Neogit' },
      { '<leader>gL', '<cmd>Neogit log<cr>', desc = 'Log avec Neogit' },
    },
    config = function()
      local ok, neogit = pcall(require, 'neogit')
      if not ok then
        return
      end

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
    end,
  },

  -- ============================================================================
  -- Diffview
  -- ============================================================================
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  },
}
