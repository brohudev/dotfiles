-- Project run commands - edit nvim/lua/run_commands.lua to add your dev servers, logs, etc.
-- Commands run from git root (or current dir if no git). Set cwd = nil for project root.

local M = {}

-- Customize for your project. Paths are relative to git root.
M.commands = {
  { name = 'Frontend dev', cmd = 'npm run dev', cwd = 'frontend' },
  { name = 'Backend', cmd = './run.sh', cwd = 'backend' },
  { name = 'Backend logs', cmd = 'tail -f logs/app.log', cwd = 'backend' },
}

function M.run(cmd)
  local root = vim.fn.getcwd()
  if vim.fn.isdirectory(root .. '/.git') == 1 then
    root = vim.fn.system { 'git', 'rev-parse', '--show-toplevel' }:gsub('\n', '')
  end
  local cwd = cmd.cwd and (root .. '/' .. cmd.cwd) or root
  vim.cmd('split')
  vim.cmd('terminal cd ' .. vim.fn.shellescape(cwd) .. ' && ' .. cmd.cmd)
  vim.cmd('startinsert')
end

function M.pick()
  vim.ui.select(M.commands, {
    prompt = 'Run command:',
    format_item = function(item)
      return item.name .. ' (' .. (item.cwd or '.') .. ')'
    end,
  }, function(choice)
    if choice then
      M.run(choice)
    end
  end)
end

return M
