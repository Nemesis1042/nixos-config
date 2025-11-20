{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Nemesis1042";
      user.email = "niklashardwig5@gmail.com";

      init.defaultBranch = "main";
      credential.helper = "store";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
      side-by-side = true;
      diff-so-fancy = true;
      navigate = true;
    };
  };

  # SSH-Agent aktivieren für Git- und PI-Zugriff
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "*" = {
        forwardAgent = false;
        forwardX11 = false;
      };

      "pi" = {
        hostname = "192.168.0.50";
        user = "lager";
        identityFile = "~/.ssh/id_ed25519_pi";
      };

      "github.com" = {
        identityFile = "~/.ssh/id_rsa";
        user = "git";
        extraOptions = {
          StrictHostKeyChecking = "no";
        };
      };
    };
  };

  home.packages = [
    pkgs.gh
    pkgs.openssh
    # pkgs.git-lfs  # optional aktivieren, falls gebraucht
  ];

  programs.zsh.shellAliases = {
    g = "lazygit";
    gf = "onefetch --number-of-file-churns 0 --no-color-palette";
    ga = "git add";
    gaa = "git add --all";
    gs = "git status";
    gb = "git branch";
    gm = "git merge";
    gd = "git diff";
    gpl = "git pull";
    gplo = "git pull origin";
    gps = "git push";
    gpso = "git push origin";
    gpst = "git push --follow-tags";
    gcl = "git clone";
    gc = "git commit";
    gcm = "git commit -m";
    gcma = "git add --all && git commit -m";
    gtag = "git tag -ma";
    gch = "git checkout";
    gchb = "git checkout -b";
    glog = "git log --oneline --decorate --graph";
    glol = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'";
    glola = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all";
    glols = "git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat";
  };
}

