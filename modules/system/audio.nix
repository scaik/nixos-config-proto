{ pkgs, lib, config, ... }:

{

  options.audio.enable = lib.mkEnableOption "Enable audio module";

  config = lib.mkIf config.audio.enable {

    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wireplumber
      pavucontrol
      pamixer
      playerctl
    ];

  };

}
