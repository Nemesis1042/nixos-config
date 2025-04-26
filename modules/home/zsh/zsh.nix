{ hostname, config, pkgs, host, lib, ... }:

{
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      plugins = [
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
      ];

      completionInit = ''
        # your existing completion stuff (no changes needed)
      '';

      initContent = lib.mkBefore ''
        # === Former initExtraFirst ===
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi

        DISABLE_AUTO_UPDATE=true
        DISABLE_MAGIC_FUNCTIONS=true
        export "MICRO_TRUECOLOR=1"

        setopt sharehistory
        setopt hist_ignore_space
        setopt hist_ignore_all_dups
        setopt hist_save_no_dups
        setopt hist_ignore_dups
        setopt hist_find_no_dups
        setopt hist_expire_dups_first
        setopt hist_verify

        source ~/.p10k.zsh

        _fzf_compgen_path() { fd --hidden --exclude .git . "$1"; }
        _fzf_compgen_dir() { fd --type=d --hidden --exclude .git . "$1"; }
        _fzf_comprun() {
          local command=$1
          shift
          case "$command" in
            cd)  fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
            ssh) fzf --preview 'dig {}' "$@" ;;
            *)   fzf --preview "$show_file_or_dir_preview" "$@" ;;
          esac
        }

        if (( ''${+terminfo[smkx]} )) && (( ''${+terminfo[rmkx]} )); then
          function zle-line-init() { echoti smkx }
          function zle-line-finish() { echoti rmkx }
          zle -N zle-line-init
          zle -N zle-line-finish
        fi
        # === End of Former initExtraFirst ===
      '';
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

