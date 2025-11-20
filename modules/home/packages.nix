{ inputs, pkgs, ... }: 
let 
  _2048 = pkgs.callPackage ../../pkgs/2048/default.nix {};
  python = pkgs.python3;
in
{
  home.packages = (with pkgs; [
    _2048

    ## CLI utility
    pyenv
    python311Packages.pip
    hydra 
    nodejs_22
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
    lftp
    woomer
    yt-dlp-light
    xdg-utils
    xxd
    masterpdfeditor
    alacritty
    vscode
    neofetch
    netbeans
    glib
    gvfs
    docker-client
    zip
    php
    php83Packages.composer
    chromium
    tor-browser
    sqlitebrowser
    scenic-view
    #flutter 
    android-studio
    maven
    pnpm
    pkg-config
    libusb1
    systemd.dev
    go
    usbutils
    epson-escpr
    gutenprint
    signal-desktop
    dotnetCorePackages.sdk_8_0_3xx
    scenebuilder
    flutterPackages-source.stable
    yubioath-flutter


    # Electron runtime libs
    glib
    gtk3
    nss
    alsa-lib
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXcomposite
    xorg.libXi
    xorg.libXtst
    openjdk21

    ## CLI 
    cbonsai                           # terminal screensaver
    cmatrix
    pipes                             # terminal screensaver
    sl
    tty-clock                         # cli tty-clock
    inkscape
    ollama
    signal-cli
    systemd

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
    wlr-randr
    bluez
    blueman

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
    wasistlos
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
    
    #Other stuff
    localsend

    #Kasse
    openjfx
    gtk3
    glib
    xorg.libXxf86vm
    mesa
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libXrandr
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXfixes
    xorg.libXdamage
    xorg.libXcomposite
    xorg.libXScrnSaver
    libGL

    inputs.alejandra.defaultPackage.${system}
  ]);
}
