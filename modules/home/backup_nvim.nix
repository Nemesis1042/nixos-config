{ pkgs, ... }:
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
    ];

    extraConfig = ''
      " Tokyonight aktivieren
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

        cmp.setup {
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
        }

        require("mason").setup()
        require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls" , "clangd" },
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local servers = { 'lua_ls', 'pyright', "ts_ls", 'clangd' }
        for _, lsp in ipairs(servers) do
          lspconfig[lsp].setup {
            capabilities = capabilities,
          }
        end
      EOF
    '';
  };
}

