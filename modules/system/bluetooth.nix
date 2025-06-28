{ pkgs, lib, config, ... }:

{

  options.bluetooth.enable = lib.mkEnableOption "Enable bluetooth module";

  config = lib.mkIf config.bluetooth.enable {

    hardware.bluetooth.enable = true;

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [ bluez bluez-tools ];

  };

}
