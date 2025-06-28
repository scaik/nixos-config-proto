{ lib, config, ... }:

{

  options.git.enable = lib.mkEnableOption "Enable git module";

  config = lib.mkIf config.git.enable {

    programs.git = {
      enable = true;
      userName = "Evsey Kazansky";
      userEmail = "67639168+scaik@users.noreply.github.com";
    };

  };

}
