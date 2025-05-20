{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      tokyonight-nvim
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip
      lualine-nvim
      mason-nvim
      mason-lspconfig-nvim
      nvim-lspconfig
      nvim-tree-lua
      gitsigns-nvim
      comment-nvim
      which-key-nvim
      friendly-snippets
      nvim-autopairs
      toggleterm-nvim
      indent-blankline-nvim
      nvim-surround
      nvim-notify
      noice-nvim
      nvim-dap
      nvim-dap-ui
      bufferline-nvim
      auto-session
    ];
  };

  xdg.configFile."nvim/init.lua".source = ./nvim/init.lua;
  xdg.configFile."nvim/lua/lsp.lua".source = ./nvim/lua/lsp.lua;
  xdg.configFile."nvim/lua/plugins.lua".source = ./nvim/lua/plugins.lua;
  xdg.configFile."nvim/lua/ui.lua".source = ./nvim/lua/ui.lua;
  xdg.configFile."nvim/lua/test.lua".source = ./nvim/lua/test.lua;
  xdg.configFile."nvim/lua/dap.lua".source = ./nvim/lua/dap.lua;
}

