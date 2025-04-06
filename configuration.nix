# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

let
  sddm-candy = pkgs.callPackage ./sources/sddm-candy.nix { };
  sddm-corners = pkgs.callPackage ./sources/sddm-corners.nix { };
in
{

  imports = [

    ./hardware-configuration.nix
    ./nixld.nix

    # ./home/home-manager.nix
    # ./themes/stylix/pinky.nix
    # ./shell.nix

    # ./python.nix
    # ./hosts/desktop
    # ./packages
    # ./home/home.nix
    # ./nvidia.nix
    ./var.nix

    # ./devenv.nix
  ];

  # Bootloader.

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot = {
    initrd = {
      kernelModules = [ "nvidia" ];
    };
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      # driSupport = true;
      # driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      # forceFullCompositionPipeline = true;
      powerManagement.enable = true;
      # prime = {
      #   nvidiaBusId = "PCI:1:0:0";
      #   amdgpuBusId = "PCI:101:0:0";
      #
      # };
    };
    # opengl.enable = true;
    #
    #

  };

  services.xserver.videoDrivers = [ "nvidia" ];
  # home-manager.users.jonwick = { imports = [ ./home/home.nix ]; };

  # hardware.pulseaudio.enable = false; # Use Pipewire, the modern sound subsystem

  security.rtkit.enable = true; # Enable RealtimeKit for audio purposes
  security.krb5.enable = true;

  #sound.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pulse.enable = true;
  # };

  #
  # Bluetooth
  #
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.wireless.iwd.enable = true;
  # networking.networkmanager.dns = "none";
  #   networking.useDHCP = false;
  # networking.dhcpcd.enable = false;
  #
  # networking.networkmanager.wifi.powersave = true;

  #
  # networking.networkmanager.wifi.backend = "iwd";
  # networking.wireless.iwd.enable = true;
  # networking.wireless.iwd.settings = {
  #   IPv6 = { Enabled = true; };
  #   Settings = { AutoConnect = true; };
  # };
  # services.connman.wifi.backend = "iwd";
  # services.gnome.gnome-keyring.enable = true;
  #
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    enable = true;

    libinput = {
      enable = true;

      # disabling mouse acceleration
      # mouse = {
      #   accelProfile = "flat";
      # };
      #
      # # disabling touchpad acceleration
      # touchpad = {
      #   accelProfile = "flat";
      # };
    };
  };

  # services.xserver.xkb = {
  #   layout = "us";
  #   variant = "";
  #   #videoDrivers = ["nvidia"];
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  #
  users.users.jonwick = {
    isNormalUser = true;
    description = "Jon Wick";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    (pkgs.buildFHSUserEnv {
      name = "anyconnect";
      targetPkgs =
        pkgs: with pkgs; [
          bash
          coreutils
          glibc
          systemd
          libxcrypt # Sometimes needed for PAM
          dbus
          procps
          iproute2
        ];
      runScript = "bash";
    })
    rustc
    cargo
    rustup
    libsForQt5.kdeconnect-kde
    steam-run
    openconnect
    unzip
    python3Packages.pyqt5
    python3Packages.lxml
    python3Packages.requests
    globalprotect-openconnect

    localsend
    (buildFHSUserEnv {
      name = "anyconnect";
      targetPkgs =
        pkgs: with pkgs; [
          bash
          coreutils
          glibc
          systemd
          libxcrypt # Sometimes needed for PAM
          dbus
          procps
          iproute2
        ];
      runScript = "bash";
    })
    nix
    openconnect
    # buildFHSUserEnv
    krb5
    mesa
    egl-wayland
    libsecret
    wayland
    wayland-utils
    kdePackages.wayland-protocols

    # waland-protocols
    xorg.libX11
    nspr
    nss

    R
    pipx
    connman
    nix-ld

    javascript-typescript-langserver
    nodejs
    bun
    firebase-tools
    nodenv

    xorg.xhost

    iwgtk

    sddm-candy
    sddm-corners
    libsForQt5.qt5.qtquickcontrols # for sddm theme ui elements
    libsForQt5.layer-shell-qt # for sddm theme wayland support
    libsForQt5.qt5.qtquickcontrols2 # for sddm theme ui elements
    libsForQt5.qt5.qtgraphicaleffects # for sddm theme effects
    libsForQt5.qtsvg # for sddm theme svg icons
    libsForQt5.qt5.qtwayland # wayland support for qt5
    # libsForQt5.xwaylandvideobridge
    #cli tools
    neovim
    kanata
    # zsh
    tmux
    git
    #apps
    kitty
    discord
    vivaldi
    firefox
    obsidian
    teams-for-linux
    thunderbird
    gparted
    steam
    konsole
    # Hyprland and utils
    waybar
    yazi
    alsa-utils
    kdePackages.okular
    kdePackages.systemsettings
    wl-clipboard
    #hyprland-protocols
    hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gnome
    xwayland
    wofi
    #xdg-utils
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    # xfce.thunar
    thefuck

    pipewire
    pulseaudio

    home-manager
    libreoffice
    asusctl

    pavucontrol

    #Compilers
    libgcc
    gcc
    jdk
    ags
    #jdk22
    # openssl
    openssl_1_1
    zstd
    gnumake
    python312Packages.zstd
    # python312Packages.conda
    python312Packages.pybigwig
    python312Packages.pip
    python312Packages.matplotlib
    (python3.withPackages (
      ps: with ps; [
        numpy
        pandas
        matplotlib
        dash
        pybigwig
        zstd
        seaborn-data
        plotly
      ]
    ))
    python312
    virtualenv
    # conda
    # (python3.withPackages (p: [ p.mypy ]))

    gh

    gtk4
    gtk3
    gsettings-desktop-schemas

    glib
    glibc
    boost
    libxml2
    libglibutil
    samtools
    wget
    intltool
    libpng
    mariadb

    connmanFull

    # connman-gtk
    networkmanagerapplet
    networkmanager_dmenu
    kdePackages.plasma-nm
    kdePackages.networkmanager-qt

    lshw
    lshw-gui

    micromamba

    fish
    zsh
    perl
    zlib

    xorg.libSM
    xorg.libICE
    xorg.libXrender
    libselinux

    libxcrypt
    # libxcrypt-legacy
    distrobox
    distrobox-tui
  ];

  # environment.variables = {
  #
  #   LD_LIBRARY_PATH =
  #     "${pkgs.gcc}/lib:/nix/store/kvrhj41ziwxpaz10fql4xypqzvfq3yp7-system-path/lib:$LD_LIBRARY_PATH";
  #
  # };
  nixpkgs.config.permittedInsecurePackages = [ "openssl-1.1.1w" ];

  virtualisation.vmware.host.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services = {
    desktopManager.plasma6.enable = true;

    # desktopManager.plasma6.enable = true;
    #
    libinput.enable = true;
    blueman.enable = true;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      wireplumber.enable = true;
    };

    dbus.enable = true;
    udisks2 = {
      enable = true;
      mountOnMedia = true;
    };

    openssh.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };
        # package = pkgs.libsForQt5.sddm;
        extraPackages = with pkgs; [
          # sddm-sugar-dark
          sddm-candy
          sddm-corners
          #   libsForQt5.qt5.qtquickcontrols # for sddm theme ui elements
          #   libsForQt5.layer-shell-qt # for sddm theme wayland support
          #   libsForQt5.qt5.qtquickcontrols2 # for sddm theme ui elements
          #   libsForQt5.qt5.qtgraphicaleffects # for sddm theme effects
          #   libsForQt5.qtsvg # for sddm theme svg icons
          # libsForQt5.qt5.qtwayland # wayland support for qt5
          #   # bibata-cursors
          #   # Bibata-Modern-Ice
        ];
        theme = "Candy";
        settings = {
          General = {
            GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
          };
          Theme = {
            ThemeDir = "/run/current-system/sw/share/sddm/themes";
            CursorTheme = "bibata-cursors";
          };
        };
        # extraPackages = with pkgs; [
        #   # sddm-sugar-dark
        #   sddm-candy
        #   sddm-corners
        #   libsForQt5.qt5.qtquickcontrols # for sddm theme ui elements
        #   libsForQt5.layer-shell-qt # for sddm theme wayland support
        #   libsForQt5.qt5.qtquickcontrols2 # for sddm theme ui elements
        #   libsForQt5.qt5.qtgraphicaleffects # for sddm theme effects
        #   libsForQt5.qtsvg # for sddm theme svg icons
        # libsForQt5.qt5.qtwayland # wayland support for qt5
        #   # bibata-cursors
        #   # Bibata-Modern-Ice
        # ];
        # theme = "Candy";
        # settings = {
        #   General = {
        #     GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell";
        #   };
        #   Theme = {
        #     ThemeDir = "/run/current-system/sw/share/sddm/themes";
        #     CursorTheme = "bibata-cursors";
        #   };
        # };
      };
      sessionPackages = [ pkgs.hyprland ];
    };

    upower.enable = true;

  };
  programs.nix-ld.libraries = with pkgs; [
    krb5
    nss
    nspr
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    libgtkflow3
    gtk3
    cairo
    gcc
    libxml2
    pango
    glib
    boost
    atk
    gdk-pixbuf
    webkitgtk
    libsoup
    gdk-pixbuf-xlib
    webp-pixbuf-loader
    xorg.libXrender
    xorg.libXrandr

    stdenv.cc.cc
    zlib
    fuse3
    icu
    openssl
    curl
    expat
    #for openconnect-sso
    libsecret
    krb5
    xorg.libX11
    nspr
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrender
    x11basic
    # xorg.xlibs
    #for cisco annyconenct
    gcc
    glibc
    libglibutil

    glib
    libxml2
    xorg.libXrandr
    gtk3
    atk
    pango
    gdtoolkit_3
    gdk-pixbuf
    cairo
    xorg.xhost
    libgtkflow3
    webkitgtk
    libsoup
    gdk-pixbuf
    shared-mime-info

  ];
  programs.dconf.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  systemd.services.vpnagentd = {
    enable = true;
    description = "Cisco AnyConnect VPN Agent";
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "/opt/cisco/anyconnect/bin/vpnagentd";
      Restart = "always";
      User = "root";
    };
  };

  services.kanata = {
    enable = true;
    keyboards = {
      "misc".config = ''
                  
        (defsrc
          caps
        )

        (defalias
          escctrl  (tap-hold 100 100 esc lmet)

        )

        (deflayer base
          @escctrl
        )
      '';
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
  };

  # programs.conda.package = pkgs.conda.override {
  #   extraLibraries = pkgs:  ++ extraPackages;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
