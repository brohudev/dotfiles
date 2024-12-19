local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'plugins' }, -- import all the plugins in that folder.
  { -- rose pine everythinggggg
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'rose-pine'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  { -- zellij > tmux fight me
    'https://github.com/fresh2dev/zellij.vim',
    -- Pin version to avoid breaking changes.
    -- tag = '0.3.*',
    lazy = false,
    init = function()
      -- Options:
      -- vim.g.zelli_navigator_move_focus_or_tab = 1
      -- vim.g.zellij_navigator_no_default_mappings = 1
    end,
  },
  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = { signs = false },
  },
  -- NOTE: plugins yoinked straight from Github:
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'theprimeagen/refactoring.nvim', -- Refactoring plugin to refactor code within Neovim
  'mbbill/undotree', -- Undotree for visualizing and managing undo history
  'tpope/vim-fugitive', -- Vim Fugitive for Git integration
  'nvim-treesitter/nvim-treesitter-context', -- Treesitter context for better code context
}, {
  ui = {
    icons = vim.g.have_nerd_font or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
