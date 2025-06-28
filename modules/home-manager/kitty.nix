{ lib, config, ... }:

{

  options.kitty.enable = lib.mkEnableOption "Enable kitty module";

  config = lib.mkIf config.kitty.enable {

    hydenix.hm.terminals = {
      enable = lib.mkForce true;
      kitty.configText = ''
        confirm_os_window_close 0
      '';
    };

  };

}
