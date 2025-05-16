{pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # Theme
      tokyonight-nvim

      # Syntax Highlighting
      nvim-treesitter.withAllGrammars

      # Fuzzy Finder
      telescope-nvim
      telescope-fzf-native-nvim

      # Autovervollständigung
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip

      # Statuszeile
      lualine-nvim

      # LSP & Tools
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig

      # Dateiexplorer
      nvim-tree-lua

      # Git Integration
      gitsigns-nvim

      # Einfaches Kommentieren
      comment-nvim

      # Keybindings Übersicht
      which-key-nvim

      friendly-snippets
      nvim-autopairs
      toggleterm-nvim
      indent-blankline-nvim
      nvim-surround
      nvim-notify
      noice-nvim
    ];

    extraConfig = ''
      colorscheme tokyonight

      lua << EOF
        require('tokyonight').setup({
          style = "storm",
          transparent = false,
        })

        require('lualine').setup {
          options = { theme = 'tokyonight' },
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

        local cmp = require'cmp'
        local luasnip = require'luasnip'

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          },
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
          }, {
            { name = 'buffer' },
            { name = 'path' },
          })
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright", "clangd" },
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local servers = { 'lua_ls', 'pyright', 'clangd' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            capabilities = capabilities,
          }
        end
      EOF
    '';
  };
}

