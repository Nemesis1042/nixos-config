require('tokyonight').setup({
  style = "storm",
  transparent = false,
})

require('lualine').setup {
  options = {
    theme = "tokyonight",
    section_separators = "",
    component_separators = ""
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

require('nvim-tree').setup {}
require('gitsigns').setup {}
require('Comment').setup {}
require('which-key').setup {}
require('nvim-autopairs').setup {}
require('nvim-surround').setup {}
require("ibl").setup {}

require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = 'horizontal',
  start_in_insert = true,
}

vim.notify = require("notify")
require("notify").setup({
  stages = "slide",
  timeout = 3000,
  background_colour = "#1a1b26",
})

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    }
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  }
})

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  indent = { enable = true },
}

