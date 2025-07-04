{ pkgs, userName, ... }:

{

  programs.zsh = {
    enable = true;
    shellAliases = { nrs = "sudo nixos-rebuild switch --flake /etc/nixos"; };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    users.scaik = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "video" ];
    };
  };

}
