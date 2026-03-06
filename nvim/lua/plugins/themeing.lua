return {
  -- Atom One Dark Pro (darker variant)
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000,
    config = function()
      require('onedarkpro').setup {
        theme = 'onedark_dark',
        options = {
          cursorline = true,
        },
      }
      vim.cmd.colorscheme 'onedark_dark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      dashboard.section.header.val = {
        '                                                     ',
        '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                     ',
      }

      dashboard.section.buttons.val = {
        dashboard.button('e', '  New file', '<cmd>ene<CR>'),
        dashboard.button('f', '󰱼 Find file', '<cmd>Telescope find_files<CR>'),
        dashboard.button('g', '  File explorer', '<cmd>Neotree toggle<CR>'),
        dashboard.button('s', '󰙅  Settings (config)', "<cmd>lua require('telescope.builtin').find_files({cwd=vim.fn.stdpath('config')})<CR>"),
        dashboard.button('?', '  Keybind cheat sheet', '<cmd>Telescope keymaps<CR>'),
        dashboard.button('r', '󰁯  Restore session', '<cmd>SessionSearch<CR>'),
        dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
      }

      alpha.setup(dashboard.opts)
      vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = { mappings = vim.g.have_nerd_font },
      spec = {
        { '<leader>a', group = '[A]gent' },
        { '<leader>b', group = '[B]uffer' },
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>f', group = '[F]ormat' },
        { '<leader>g', group = '[G]it' },
        { '<leader>r', group = '[R]un / [R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]ab' },
        { '<leader>w', group = '[W]indow' },
        { '<leader>x', group = 'Session' },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = { indent = { char = '┊' } },
  },
}
