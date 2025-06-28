{ pkgs, lib, config, ... }:

{

  options.hyprland.enable = lib.mkEnableOption "Enable hyprland module";

  config = lib.mkIf config.hyprland.enable {

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.sessionVariables = { WLR_NO_HARDWARE_CURSORS = "1"; };

  };

}
