{
  hostname,
  config,
  pkgs,
  host,
  ...
}:
{
  programs.zsh = {
    shellAliases = {
      # Utils
      c = "clear";
      cd = "z";
      tt = "gtrash put";
      cat = "bat";
      nano = "micro";
      code = "codium";
      diff = "delta --diff-so-fancy --side-by-side";
      less = "bat";
      y = "yazi";
      py = "python";
      ipy = "ipython";
      icat = "kitten icat";
      dsize = "du -hs";
      pdf = "tdf";
      open = "xdg-open";
      space = "ncdu";
      man = "BAT_THEME='default' batman";
      png = "kitty +kitten icat";

      l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
      ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd ~/nixos-config && codium ~/nixos-config";
      ns = "nom-shell --run zsh";
      nix-switch = "nh os switch";
      nix-update = "nh os switch --update";
      nix-clean = "nh clean all --keep 5";
      nix-search = "nh search";
      nix-test = "nh os test";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos-config#laptop";

      # python
      piv = "python -m venv .venv";
      psv = "source .venv/bin/activate";

      install= "nvim /home/arkatosh/nixos-config/modules/home/packages.nix";
      wifi= "nmtui";
      timezone= "cd /home/arkatosh/nixos-config/modules/home/scripts/scripts && ./set-dynamic-timezone.sh";
      manwha= "psv && cd manhwa"; 
    };
  };
}
