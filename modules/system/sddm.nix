{ pkgs, lib, config, ... }:

let
  xcfg = config.services.xserver;
  westonIni = (pkgs.formats.ini { }).generate "weston.ini" {
    libinput = {
      enable-tap = config.services.libinput.mouse.tapping;
      left-handed = config.services.libinput.mouse.leftHanded;
    };
    keyboard = {
      keymap_model = xcfg.xkb.model;
      keymap_layout = xcfg.xkb.layout;
      keymap_variant = xcfg.xkb.variant;
      keymap_options = xcfg.xkb.options;
    };
    output = {
      name = "WL2";
      mode = "1920x1080@144";
    };
  };
in
{

  options.sddm.enable = lib.mkEnableOption "Enable sddm module";

  config = lib.mkIf config.sddm.enable {

    hydenix.sddm = {
      enable = lib.mkForce true;
      theme = "Corners";
    };

    services.displayManager.sddm.settings = {
      Wayland.CompositorCommand = "${lib.getExe pkgs.weston} --shell=kiosk -c ${westonIni}";
    };

  };

}
