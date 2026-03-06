-- Custom project picker with leader-prefixed keys (avoids conflict with vim defaults)
-- In picker: press Esc then <leader>d delete, <leader>f find files, <leader>s grep, <leader>r recent, <leader>w cd
local M = {}

local function create_finder()
  local history = require 'project_nvim.utils.history'
  local finders = require 'telescope.finders'
  local entry_display = require 'telescope.pickers.entry_display'

  local results = history.get_recent_projects()
  for i = 1, math.floor(#results / 2) do
    results[i], results[#results - i + 1] = results[#results - i + 1], results[i]
  end

  local displayer = entry_display.create {
    separator = ' ',
    items = { { width = 30 }, { remaining = true } },
  }

  return finders.new_table {
    results = results,
    entry_maker = function(entry)
      local name = vim.fn.fnamemodify(entry, ':t')
      return {
        display = function(e)
          return displayer({ e.name, { e.value, 'Comment' } })
        end,
        name = name,
        value = entry,
        ordinal = name .. ' ' .. entry,
      }
    end,
  }
end

function M.open(opts)
  opts = opts or {}
  local telescope = require 'telescope'
  local ext = telescope.extensions.projects
  if not ext then
    return
  end

  opts.attach_mappings = function(prompt_bufnr, map)
    local state = require 'telescope.actions.state'
    local actions = require 'telescope.actions'
    local builtin = require 'telescope.builtin'
    local history = require 'project_nvim.utils.history'
    local project = require 'project_nvim.project'
    local config = require 'project_nvim.config'

    local function change_cwd(close)
      local entry = state.get_selected_entry(prompt_bufnr)
      if not entry then
        actions.close(prompt_bufnr)
        return nil
      end
      local path = entry.value
      if close then
        actions._close(prompt_bufnr, true)
      else
        actions.close(prompt_bufnr)
      end
      project.set_pwd(path, 'telescope')
      return path
    end

    local function delete_project()
      local entry = state.get_selected_entry(prompt_bufnr)
      if not entry then
        return
      end
      local choice = vim.fn.confirm("Delete '" .. entry.value .. "' from project list?", '&Yes\n&No', 2)
      if choice == 1 then
        history.delete_project(entry)
        state.get_current_picker(prompt_bufnr):refresh(create_finder(), { reset_prompt = true })
      end
    end

    map('n', '<leader>d', delete_project)
    map('n', '<leader>f', function()
      local path = change_cwd(true)
      if path then
        builtin.find_files { cwd = path, hidden = config.options.show_hidden, mode = 'insert' }
      end
    end)
    map('n', '<leader>s', function()
      local path = change_cwd(true)
      if path then
        builtin.live_grep { cwd = path, hidden = config.options.show_hidden, mode = 'insert' }
      end
    end)
    map('n', '<leader>r', function()
      local path = change_cwd(true)
      if path then
        builtin.oldfiles { cwd_only = true, hidden = config.options.show_hidden }
      end
    end)
    map('n', '<leader>w', function()
      change_cwd(false)
    end)

    map('n', '<CR>', function()
      local path = change_cwd(true)
      if path then
        builtin.find_files { cwd = path, hidden = config.options.show_hidden, mode = 'insert' }
      end
    end)

    return true
  end

  ext.projects(opts)
end

return M
