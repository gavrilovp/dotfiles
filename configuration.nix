{ config, pkgs, ... }:

{
  imports =
    [ 
      <nixos-hardware/lenovo/thinkpad/x1/yoga/7th-gen>
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";


  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "teams-1.5.00.23861" ];
  };

  services = {
    xserver = {
      enable = true;

      layout = "us,ru";

      xkbOptions = "grp:caps_toggle";

      libinput.touchpad.naturalScrolling = true;

      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
      displayManager.defaultSession = "xfce";

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

      notion-app-enhanced

      # runtimes
      python3

      # development
      git
      vscode
      docker-compose

      # network
      openvpn
      netbird-ui

      # communications
      thunderbird
      slack
      tdesktop
      teams

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

      pavucontrol

      vlc
      unetbootin
      rambox-pro
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
    vim 
    wget
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "23.05";
}

