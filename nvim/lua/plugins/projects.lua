return {
  {
    'Shatur/neovim-session-manager',
    cmd = 'SessionManager',
    lazy = false,
    priority = 99, -- load just before neovim-project
    config = function()
      require('session_manager').setup {
        sessions_dir = vim.fn.stdpath 'data' .. '/sessions',
        session_filename_to_dir = function(filename)
          return vim.fn.getcwd()
        end,
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
        autosave_last_session = true,
        autosave_ignore_dirs = {
          vim.fn.expand '~',
          '/tmp',
          '/var/tmp',
        },
        autosave_ignore_filetypes = {
          'ccc-ui',
          'dap-repl',
          'dap-view',
          'dap-view-term',
          'gitcommit',
          'gitrebase',
          'qf',
          'toggleterm',
        },
      }
    end,
  },
  {
    'coffebar/neovim-project',
    lazy = false,
    priority = 100,
    init = function()
      vim.opt.sessionoptions:append 'globals'
    end,
    config = function()
      require('neovim-project').setup {
        projects = {
          '~/projects/personal/*',
          '~/treasurechest/Startup/*',
          '~/projects/pxq/*',
          '~/.config/*',
        },
        picker = {
          type = 'telescope',
          preview = {
            enabled = true,
            git_status = true,
            git_fetch = false,
            show_hidden = true,
          },
        },
        last_session_on_startup = true,
        dashboard_mode = false,
        follow_symlinks = 'full',
        per_branch_sessions = false,
      }

      -- Keymaps for project management
      local opts = { noremap = true, silent = true }

      -- Project picker
      vim.keymap.set('n', '<leader>pp', '<cmd>NeovimProjectDiscover<CR>', vim.tbl_extend('force', opts, { desc = '[P]roject [P]icker' }))
      -- Project history
      vim.keymap.set('n', '<leader>ph', '<cmd>NeovimProjectHistory<CR>', vim.tbl_extend('force', opts, { desc = '[P]roject [H]istory' }))
      -- Recent session
      vim.keymap.set('n', '<leader>pr', '<cmd>NeovimProjectLoadRecent<CR>', vim.tbl_extend('force', opts, { desc = '[P]roject [R]ecent' }))
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'Shatur/neovim-session-manager',
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
    },
  },
}
