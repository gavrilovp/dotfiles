{ config, pkgs, ... }:

{
  imports =
    [ 
      <nixos-hardware/lenovo/thinkpad/x1/yoga/7th-gen>
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Europe/Moscow";


  nixpkgs.config = {
    allowUnfree = true;
  };

  services = {
    xserver = {
      enable = true;

      layout = "us,ru";

      xkbOptions = "grp:caps_toggle";

      libinput.touchpad.naturalScrolling = true;

      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
  
  services.printing.enable = true;

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

  users.users.pavel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "audio" ];
    packages = with pkgs; [
      chromium
      firefox

      notion-app-enhanced

      # development
      git
      vscode
      docker-compose

      # network
      openvpn

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
    ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "23.05"; # Did you read the comment?

}

