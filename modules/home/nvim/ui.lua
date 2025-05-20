-- Kann optional sein – z. B. UI-spezifische Konfigurationen
-- Du kannst diesen leerlassen oder z. B. IBL oder andere UI-Elemente reinlegen
-- Beispiel:

-- bufferline config example
require('bufferline').setup({
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    show_buffer_close_icons = true,
    show_close_icon = false,
  },
})

-- keymap for bufferline
vim.api.nvim_set_keymap('n', '<Tab>', ":BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ":BufferLineCyclePrev<CR>", { noremap = true })


vim.o.relativenumber = true
vim.o.number = true

