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
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  users.users.pavel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    packages = with pkgs; [
      firefox

      notion-app-enhanced

      git
      vscode

      docker-compose

      thunderbird
      slack
      tdesktop
      teams

      libreoffice
    ];
  };

  environment.systemPackages = with pkgs; [
    vim 
    wget
  ];

  virtualisation.docker.enable = true;

  system.stateVersion = "22.11"; # Did you read the comment?

}

