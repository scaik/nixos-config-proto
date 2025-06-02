{ lib, config, ... }:

{

  options.gaming.enable = lib.mkEnableOption "Enable gaming module";

  config = lib.mkIf config.gaming.enable {

    hydenix.gaming.enable = lib.mkForce true;

    programs.gamemode.enable = true;

  };

}
