{
  inputs,
  pkgs,
  lib,
  stateVersion,
  userName,
  ...
}:

{

  imports = [
    inputs.hydenix.lib.homeModules
    inputs.nix-index-database.hmModules.nix-index

    ./kitty.nix
    ./git.nix
    ./hyprland.nix
    ./social.nix
    ./zed
    ./zen-browser.nix
    ./zsh.nix
  ];

  kitty.enable = lib.mkDefault true;
  git.enable = lib.mkDefault true;
  hyprland.enable = lib.mkDefault true;
  social.enable = lib.mkDefault true;
  zed.enable = lib.mkDefault true;
  zen-browser.enable = lib.mkDefault true;
  zsh.enable = lib.mkDefault true;

  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = stateVersion;

    packages = with pkgs; [
      fastfetch
      rustup
    ];
  };

  hydenix.hm = {
    enable = true;

    dolphin.enable = false;
    editors.enable = false;
    firefox.enable = false;
    git.enable = false;
    gtk.enable = false;
    hyde.enable = false;
    hyprland.enable = false;
    lockscreen.enable = false;
    notifications.enable = false;
    qt.enable = false;
    rofi.enable = false;
    screenshots.enable = false;
    shell.enable = false;
    social.enable = false;
    spotify.enable = false;
    swww.enable = false;
    terminals.enable = false;
    theme.enable = false;
    waybar.enable = false;
    wlogout.enable = false;
    xdg.enable = false;
  };

}
