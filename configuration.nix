{ config, pkgs, ... }:

{
  imports =
    [ 
      <nixos-hardware/lenovo/thinkpad/x1/yoga/7th-gen>
      /etc/nixos/hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.hostPlatform = "x86_64-linux";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  services = {
    libinput.touchpad.naturalScrolling = true;
    displayManager.defaultSession = "xfce";

    xserver = {
      enable = true;

      xkb.layout = "us,ru";
      xkb.options = "grp:caps_toggle";

      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };

      windowManager.i3.enable = true;
    };
  };
  
  services.printing.enable = true;

  services.netbird.enable = true;
  services.resolved.enable = true;

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-switch-on-connect
    '';
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = {
    General = {
      Enable = "Control,Gateway,Headset,Media,Sink,Socket,Source";
    };
  };
  systemd.services.bluetooth.serviceConfig.ExecStart = [
    ""
    "${pkgs.bluez}/libexec/bluetooth/bluetoothd -f /etc/bluetooth/main.conf"
  ];
  services.blueman.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
  };

  users.users.pavel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "audio" ];
    packages = with pkgs; [
      chromium
      firefox

      # runtimes
      python3

      # development
      git
      docker-compose

      # network
      openvpn
      netbird-ui

      darktable

      # communications
      thunderbird
      tdesktop
      teams-for-linux
      zoom-us

      libreoffice
      (texlive.combine {
        inherit (texlive)
          collection-basic
          metafont
          xits
          collection-bibtexextra
          collection-binextra
          collection-context
          collection-formatsextra
          collection-fontutils
          #collection-genericextra
          #collection-genericrecommended
          collection-langcyrillic
          collection-langenglish
          collection-latex
          collection-latexextra
          collection-latexrecommended
          #collection-mathextra
          collection-pictures
          #collection-plainextra
          collection-pstricks
          #collection-science
          collection-xetex;
      })
      projectlibre

      pavucontrol

      zathura

      vlc
      unetbootin
      rambox-pro

      unzip
      unrar

      yandex-disk
    ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  environment.systemPackages = with pkgs; [
    emacs
    vim 
    wget
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "24.05";
}

