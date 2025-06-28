{ pkgs, lib, config, ... }:

{

  options.social.enable = lib.mkEnableOption "Enable social module";

  config = lib.mkIf config.social.enable {

    hydenix.hm.social = {
      enable = lib.mkForce true;
      discord.enable = false;
      webcord.enable = true;
      vesktop.enable = false;
    };

    home.packages = with pkgs; [ telegram-desktop ];

  };

}
