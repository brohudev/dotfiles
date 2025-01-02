return {
  'rmagatti/auto-session',
  lazy = true,
  opts = {
    root_dir = vim.fn.stdpath 'data' .. '/sessions/',
    auto_save = true,
    auto_restore = true,
    log_level = 'error',
    -- Telescope integration for session management
    session_lens = {
      load_on_setup = true,
      mappings = {
        delete_session = { 'n', 'dd' }, -- Delete session
        alternate_session = { 'n', 'aa' }, -- Switch to alternate session
        copy_session = { 'n', 'yy' }, -- Copy session
      },
    },
  },
  config = function(_, opts)
    require('auto-session').setup(opts)

    -- Keybindings for session management
    vim.keymap.set('n', '<leader>ss', ':SessionSave<CR>', { desc = 'Save Session' })
    vim.keymap.set('n', '<leader>sl', ':SessionLoad<CR>', { desc = 'Load Session' })
    vim.keymap.set('n', '<leader>sd', ':SessionDelete<CR>', { desc = 'Delete Session' })
    vim.keymap.set('n', '<leader>sh', ':Telescope session-lens<CR>', { desc = 'Session Picker' })
  end,
}
