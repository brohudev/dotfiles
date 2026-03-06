-- Pi Mono coding agent (pi-coding-agent) - runs in terminal, not side pane
-- Requires: npm install -g @mariozechner/pi-coding-agent (then `pi` in PATH)
return {
  {
    'aldoborrero/pi-agent.nvim',
    cmd = { 'PiAgent', 'PiAgentContinue', 'PiAgentResume', 'PiAgentVerbose' },
    keys = {
      { '<leader>ag', '<cmd>PiAgent<CR>', desc = '[A]gent: Toggle Pi' },
      { '<leader>aC', '<cmd>PiAgentContinue<CR>', desc = '[A]gent: Continue last' },
      { '<leader>aR', '<cmd>PiAgentResume<CR>', desc = '[A]gent: Resume picker' },
    },
    opts = {
      command = 'pi',
      window = {
        position = 'float',
        split_ratio = 0.3,
        enter_insert = true,
        hide_numbers = true,
        hide_signcolumn = true,
        float = {
          width = '85%',
          height = '85%',
          row = 'center',
          col = 'center',
          relative = 'editor',
          border = 'rounded',
        },
      },
      refresh = { enable = true },
      git = { use_git_root = true },
      keymaps = {
        toggle = { normal = '<leader>ag', terminal = '<C-,>' },
        window_navigation = true,
        scrolling = true,
      },
    },
  },
}
