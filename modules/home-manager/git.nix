{ pkgs, lib, config, ... }:

{

  options.git.enable = lib.mkEnableOption "Enable git module";

  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      userName = "Evsey Kazansky";
      userEmail = "thescaik@icloud.com";
    };

  };

}
