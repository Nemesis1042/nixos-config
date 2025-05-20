local dap = require('dap')
local dapui = require('dapui')

-- Basic adapter setup (example: Python)
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = '${file}',
    pythonPath = function()
      return '/usr/bin/python' -- or dynamically detect venv/python
    end,
  },
}

-- DAP UI setup
dapui.setup()

-- Open UI automatically on dap events
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- Keymaps for dap (customize as you want)
vim.api.nvim_set_keymap('n', '<F5>', "<Cmd>lua require'dap'.continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', "<Cmd>lua require'dap'.step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>b', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true })

