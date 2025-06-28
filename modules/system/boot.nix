{ lib, config, ... }:

{

  options.boot.enable = lib.mkEnableOption "Enable boot module";

  config = lib.mkIf config.boot.enable {

    hydenix.boot = {
      enable = lib.mkForce true;
      useSystemdBoot = false;
      grubTheme = "Pochita";
    };

    boot.loader = { efi.canTouchEfiVariables = lib.mkForce false; };

  };
}
