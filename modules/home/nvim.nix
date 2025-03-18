{ pkgs, inputs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };

  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;
      viAlias = true;

      ## 🌙 Theme & UI
      theme = {
        enable = true;
        name = "tokyonight"; # Alternatives: "gruvbox", "catppuccin"
        style = "storm";      # "storm", "night", "day"
        transparent = false;
      };

      statusline.lualine.enable = true;

      ## 🔍 Navigation (Removed `luaConfig`)
      telescope.enable = true;
      which-key.enable = true;

      ## 🔧 LSP
      lsp = {
        formatOnSave = true;
        lspkind.enable = true;
        lightbulb.enable = true;
        lspsaga.enable = true;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      treesitter.enable = true;
      treesitter.autoInstall = true;

      ## 📝 Programming Languages
      languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        clang.enable = true;
        python.enable = true;
        lua.enable = true;
        bash.enable = true;
        rust.enable = true;
      };

      ## 📦 Manually Adding Plugins
      extraPlugins = [
        pkgs.vimPlugins.nvim-cmp
        pkgs.vimPlugins.cmp-nvim-lsp
        pkgs.vimPlugins.cmp-buffer
        pkgs.vimPlugins.cmp-path
        pkgs.vimPlugins.cmp-cmdline
        pkgs.vimPlugins.luasnip
        pkgs.vimPlugins.nvim-autopairs
        pkgs.vimPlugins.lspkind-nvim
        pkgs.vimPlugins.comment-nvim
        pkgs.vimPlugins.gitsigns-nvim
        pkgs.vimPlugins.todo-comments-nvim
        pkgs.vimPlugins.harpoon
        pkgs.vimPlugins.neo-tree-nvim
        pkgs.vimPlugins.telescope-fzf-native-nvim  # Added FZF extension manually
      ];

      ## ✅ Corrected Lua Config (Replaced `luaConfig` with `extraConfigLuaPost`)
      extraConfigLuaPost = ''
        require('telescope').setup{
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
      '';
    };
  };
}

