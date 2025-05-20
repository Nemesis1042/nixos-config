local neotest = require('neotest')

neotest.setup({
  adapters = {
    require('neotest-python')({
      -- extra arguments here if needed
      dap = { justMyCode = false }, -- debug options
    }),
    -- add other adapters if needed
  },
  -- optional config for output, icons, summary
  output = {
    enabled = true,
    open_on_run = true,
  },
})
  
-- Keymaps to run tests quickly
vim.api.nvim_set_keymap('n', '<Leader>tn', "<Cmd>lua require'neotest'.run.run()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>tf', "<Cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ts', "<Cmd>lua require'neotest'.summary.toggle()<CR>", { noremap = true })

