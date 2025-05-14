{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # Plugin-Manager
      packer-nvim

      # Themes & UI
      tokyonight-nvim
      lualine-nvim
      bufferline-nvim
      dressing-nvim
      indent-blankline-nvim
      trouble-nvim
      nvim-treesitter-context

      # Syntax & Highlighting
      (nvim-treesitter.withAllGrammars)

      # Fuzzy Finder
      telescope-nvim
      telescope-fzf-native-nvim
      plenary-nvim

      # File Explorer
      nvim-tree-lua

      # Git Integration
      gitsigns-nvim
      vim-fugitive

      # Commenting
      #numToStr-comment-nvim

      # Keybinding Hilfe
      which-key-nvim

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer

      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip

      # LSP & Tooling
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig
      null-ls-nvim
    ];

    extraConfig = ''
      colorscheme tokyonight

      lua << EOF
        -- UI & Theme
        require("tokyonight").setup({})
        require("lualine").setup({ options = { theme = "tokyonight" } })
        require("bufferline").setup({})
        require("dressing").setup()
        require("indent_blankline").setup({})
        require("trouble").setup({})
        require("treesitter-context").setup({})
        require("nvim-tree").setup({})
        require("gitsigns").setup({})
        require("Comment").setup({})
        require("which-key").setup({})

        -- Treesitter
        require("nvim-treesitter.configs").setup({
          highlight = { enable = true },
          indent = { enable = true },
        })

        -- Telescope
        require("telescope").setup({
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        })
        require("telescope").load_extension("fzf")

        -- Completion
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
          }, {
            { name = "buffer" },
            { name = "path" },
          }),
        })

        -- Mason + LSP
        require("mason").setup()
        require("mason-lspconfig").setup({
          ensure_installed = { "lua_ls", "pyright", "tsserver", "html", "cssls", "clangd" },
        })

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        for _, server in ipairs({ "lua_ls", "pyright", "tsserver", "html", "cssls", "clangd" }) do
          lspconfig[server].setup({ capabilities = capabilities })
        end

        -- null-ls für Formatierung und Linting
        local null_ls = require("null-ls")
        null_ls.setup({
          sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.nixpkgs_fmt,
            null_ls.builtins.diagnostics.eslint,
          },
          on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
              vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
              vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ async = false })
                end,
              })
            end
          end,
        })
      EOF
    '';
  };
}

