{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
  python = pkgs.python3;

  mandown = pkgs.python3Packages.buildPythonApplication rec {
    pname = "mandown";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "potatoeggy";
      repo = "mandown";
      rev = "main";
      sha256 = "0411mqks1r9rkpzzc430yp0jr5wpq8s55awk8g8rk4wxa2q3zakl";
    };

    format = "pyproject";

    nativeBuildInputs = with pkgs.python3Packages; [
      poetry-core
    ];

    propagatedBuildInputs = with pkgs.python3Packages; [
      requests
      beautifulsoup4
      rich
      click
      comicon
      feedparser
      filetype
      lxml
      natsort
      pillow
      python-slugify
      typer
      gcc.cc
      numpy
      Flask
    ];

    doCheck = false;
  };
in
{
  home.packages = (with pkgs; [
    _2048

    ## CLI utility
    hydra 
    nodejs
    ani-cli
    binsider
    bitwise                           # cli tool for bit / hex manipulation
    caligula                          # User-friendly, lightweight TUI for disk imaging
    dconf-editor
    docfd                             # TUI multiline fuzzy document finder
    eza                               # ls replacement
    entr                              # perform action when file change
    fd                                # find replacement
    ffmpeg
    file                              # Show file information 
    gtt                               # google translate TUI
    gifsicle                          # gif utility
    gtrash                            # rm replacement, put deleted files in system trash
    hexdump
    htop
    imv                               # image viewer
    jq                                # JSON processor
    killall
    libnotify
    man-pages                         # extra man pages
    mimeo
    mpv                               # video player
    ncdu                              # disk space
    nitch                             # systhem fetch util
    nixd                              # nix lsp
    nixfmt-rfc-style                  # nix formatter
    openssl
    onefetch                          # fetch utility for git repo
    pamixer                           # pulseaudio command line mixer
    playerctl                         # controller for media players
    poweralertd
    programmer-calculator
    ripgrep                           # grep replacement
    shfmt                             # bash formatter
    swappy                            # snapshot editing tool
    tdf                               # cli pdf viewer
    treefmt                           # project formatter
    tldr
    todo                              # cli todo list
    toipe                             # typing test in the terminal
    ttyper                            # cli typing test
    unzip
    valgrind                          # c memory analyzer
    wavemon                           # monitoring for wireless network devices
    wl-clipboard                      # clipboard utils for wayland (wl-copy, wl-paste)
    wget
    woomer
    yt-dlp-light
    xdg-utils
    xxd
    masterpdfeditor
    alacritty
    vscode
    neofetch
    openjdk17
    netbeans

    ## CLI 
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli clock

    ## GUI Apps
    audacity
    bleachbit                         # cache cleaner
    filezilla
    gimp
    gnome-disk-utility
    libreoffice
    nix-prefetch-github
    obs-studio
    pavucontrol                       # pulseaudio volume controle (GUI)
    pitivi                            # video editing
    gnome-calculator                  # calculator
    resources                         # GUI resources monitor
    soundwireserver
    thunderbird
    vlc
    winetricks
    wineWowPackages.wayland
    zenity

    # C / C++
    gcc
    gdb
    gnumake

    # Zig
    inputs.zig.packages.${system}.master
    zls

    # Python
    python3
    python312Packages.ipython
    virtualenv
    
    #Code
    php 
    poetry 
    


    #brave
    whatsapp-for-linux
    mysql84
    steam
    nextcloud-client
    
    #Hack
    nmap
    theharvester
    sqlmap
    nikto
    thc-hydra
    hydra-cli
    john
    johnny
    ffuf
    aircrack-ng
    wifite2
    wireshark
    sherlock


    inputs.alejandra.defaultPackage.${system}
  ]);
}
