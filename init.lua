-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


local function autocmd(group, cmds)
  vim.cmd('augroup ' .. group)
  vim.cmd('autocmd!')
  for _, cmd in ipairs(cmds) do
      local command = table.concat(vim.tbl_flatten{'autocmd', cmd}, ' ')
      vim.cmd(command)
  end
  vim.cmd('augroup END')
end

-- Autosave when focus is lost
autocmd('FocusLost', {
  {'BufLeave', '*', 'silent! :wa'}
})
