{ lib, stateVersion, hostName, userName, ... }:

{

  imports = [
    ./../../modules/home-manager
  ];

  hyprland.configText = ''
    monitor = DP-2,1920x1080@144,0x0,1
    monitor = HDMI-A-1,1920x1080@100,-1920x220,1
  '';

}
