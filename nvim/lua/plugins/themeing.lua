return {
  { -- rose pine everythinggggg
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'rose-pine'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Set header
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

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
        dashboard.button('SPC ee', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
        dashboard.button('SPC ff', '󰱼 > Find File', '<cmd>Telescope find_files<CR>'),
        dashboard.button('SPC fs', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
        dashboard.button('SPC wr', '󰁯  > Restore Session For Current Directory', '<cmd>SessionRestore<CR>'),
        dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local lualine = require 'lualine'
      local lazy_status = require 'lazy.status' -- to configure lazy pending updates count

      -- Define Rose Pine colors
      local colors = {
        love = '#eb6f92', -- Rose color (for active modes)
        gold = '#f6c177', -- Yellowish (for visual mode)
        pine = '#9ccfd8', -- Light Blue (for normal mode)
        foam = '#31748f', -- Dark Blue (for command mode)
        iris = '#c4a7e7', -- Light Purple (for background)
        text = '#e0def4', -- Text color (light)
        surface = '#1f1d2e', -- Dark background
        background = '#191724', -- Very dark background
        inactive_bg = '#26233a', -- Inactive background
      }

      -- Rose Pine Lualine theme
      local rose_pine_lualine_theme = {
        normal = {
          a = { bg = colors.iris, fg = colors.background, gui = 'bold' },
          b = { bg = colors.surface, fg = colors.text, gui = 'bold' },
          c = { bg = colors.surface, fg = colors.text },
        },
        insert = {
          a = { bg = colors.love, fg = colors.background, gui = 'bold' },
          b = { bg = colors.surface, fg = colors.text },
          c = { bg = colors.surface, fg = colors.text },
        },
        visual = {
          a = { bg = colors.gold, fg = colors.background, gui = 'bold' },
          b = { bg = colors.surface, fg = colors.text },
          c = { bg = colors.surface, fg = colors.text },
        },
        command = {
          a = { bg = colors.foam, fg = colors.background, gui = 'bold' },
          b = { bg = colors.surface, fg = colors.text },
          c = { bg = colors.surface, fg = colors.text },
        },
        replace = {
          a = { bg = colors.foam, fg = colors.background, gui = 'bold' },
          b = { bg = colors.surface, fg = colors.text },
          c = { bg = colors.surface, fg = colors.text },
        },
        inactive = {
          a = { bg = colors.inactive_bg, fg = colors.text, gui = 'bold' },
          b = { bg = colors.inactive_bg, fg = colors.text },
          c = { bg = colors.inactive_bg, fg = colors.text },
        },
      }

      -- Configure lualine with the Rose Pine theme and colorful elements
      lualine.setup {
        options = {
          theme = rose_pine_lualine_theme,
          component_separators = { left = '', right = '' }, -- Powerline separators
          section_separators = { left = '', right = '' }, -- Powerline separators
        },
        sections = {
          lualine_a = {
            {
              'mode',
              fmt = function(str)
                return str:sub(1, 1):upper()
              end,
            }, -- Show just the first letter of mode (e.g., 'N', 'I')
          },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = '#ff9e64' },
            },
            { 'encoding' },
            { 'fileformat' },
            { 'filetype' },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '┊' },
    },
  },
}
