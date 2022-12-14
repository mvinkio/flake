
{ config, pkgs, ... }:

{
  users.users.mike = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker"];
  };

  virtualisation.docker.enable = true;
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lemptop";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Amsterdam";

  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.libinput.enable = true;
  
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  programs.slock.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  system.stateVersion = "22.11";
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
     experimental-features = nix-command flakes
  '';
}

