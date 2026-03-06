return {
  {
    'rmagatti/auto-session',
    lazy = false,
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { '<leader>xf', '<cmd>SessionSearch<CR>', desc = 'Session search' },
      { '<leader>xs', '<cmd>SessionSave<CR>', desc = 'Save session' },
      { '<leader>xa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
    },
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      -- ⚠️ This will only work if Telescope.nvim is installed
      -- The following are already the default values, no need to provide them if these are already the settings you want.
      session_lens = {
        -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
        load_on_setup = true,
        previewer = false,
        mappings = {
          -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
          delete_session = { { 'i', 'n' }, '<C-D>' },
          alternate_session = { { 'i', 'n' }, '<C-S>' },
          copy_session = { { 'i', 'n' }, '<C-Y>' },
        },
        -- Can also set some Telescope picker options
        -- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
        theme_conf = {
          border = true,
          -- layout_config = {
          --   width = 0.8, -- Can set width and height as percent of window
          --   height = 0.5,
          -- },
        },
      },
    },
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = '[G]it: LazyGit' },
    },
  },
  {

    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next [c]hange' })
        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Prev [c]hange' })

        -- Git actions (leader g prefix)
        map('v', '<leader>gs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [S]tage hunk' })
        map('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[G]it [R]eset hunk' })
        map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it [S]tage hunk' })
        map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[G]it [R]eset hunk' })
        map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage buffer' })
        map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[G]it [U]ndo stage' })
        map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[G]it [R]eset buffer' })
        map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[G]it [P]review hunk' })
        map('n', '<leader>gb', gitsigns.blame_line, { desc = '[G]it [B]lame line' })
        map('n', '<leader>gd', gitsigns.diffthis, { desc = '[G]it [D]iff index' })
        map('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = '[G]it [D]iff last commit' })
        map('n', '<leader>gt', gitsigns.toggle_current_line_blame, { desc = '[G]it [T]oggle blame' })
        map('n', '<leader>gx', gitsigns.toggle_deleted, { desc = '[G]it toggle deleted' })
      end,
    },
  },
}
