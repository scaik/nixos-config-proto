{ pkgs, lib, config, ... }:

{

  options.zsh.enable = lib.mkEnableOption "Enable zsh module";

  config = lib.mkIf config.zsh.enable {

    home.packages = with pkgs; [ bat eza ];

    programs.zsh = {

      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        mkdir = "mkdir -p";
        ls = "eza -a --icons $@";
        ll = "eza -al --icons $@";
        lt = "eza -a --tree --level=1 --icons $@";
        cat = "bat";
        cd = "z";
      };

      history.size = 10000;

      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
      };

    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {

      };
    };

    programs.pay-respects.enable = true;

    home.file = {
      ".zshenv".text = ''
                #!/usr/bin/env zsh
        	function no_such_file_or_directory_handler {
        	    local red='\e[1;31m' reset='\e[0m'
        	    printf "''${red}zsh: no such file or directory: %s''${reset}\n" "$1"
        	    return 127
        	}
      '';

      ".config/lsd/config.yaml".source =
        "${pkgs.hydenix.hyde}/Configs/.config/lsd/config.yaml";
      ".config/lsd/icons.yaml".source =
        "${pkgs.hydenix.hyde}/Configs/.config/lsd/icons.yaml";
      ".config/lsd/colors.yaml".source =
        "${pkgs.hydenix.hyde}/Configs/.config/lsd/colors.yaml";
    };

  };

}
