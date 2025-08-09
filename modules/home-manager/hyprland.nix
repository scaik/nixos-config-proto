{ pkgs, lib, config, ... }:

{

  options.hyprland = {
    enable = lib.mkEnableOption "Enable hyprland module";
    configText = lib.mkOption {
      default = "";
      type = lib.types.lines;
      description = "Extra hyprland config";
    };
  };

  config = lib.mkIf config.hyprland.enable {

    home.packages = with pkgs; [ envsubst mpvpaper ];

    home.file.".config/hypr/userprefs.conf" = lib.mkForce {
      text = ''
                exec-once = mpvpaper ALL ${
                  ./../../wallpaper.mp4
                } -o "no-audio --loop-file=inf --gpu-api=vulkan"

                windowrule = immediate, class:^(steam_app_).+$

                general {
                  allow_tearing = true
                }

                input {
		  kb_layout = us,ru
		  kb_options = caps:menu
		  accel_profile = flat
              	  force_no_accel = true
              	}

		misc {
		  enable_anr_dialog = false
		}

                unbind = $mainMod, Left
                unbind = $mainMod, Right
                unbind = $mainMod, Up
                unbind = $mainMod, Down
                unbind = $mainMod, J
                unbind = $mainMod, K
                unbind = $mainMod, L
                unbind = $mainMod Control, H
                unbind = $mainMod Control, L
              	unbind = $mainMod Shift Control, left
              	unbind = $mainMod Shift Control, right
              	unbind = $mainMod Shift Control, up
            	  unbind = $mainMod Shift Control, down
            	  unbind = $mainMod Shift, Left
            	  unbind = $mainMod Shift, Right
            	  unbind = $mainMod Shift, Up
            	  unbind = $mainMod Shift, Down

                bindd = $mainMod ALT, L, [Window Management] lock screen, exec, lockscreen.sh
                bindd = $mainMod ALT, J, [Window Management] toggle split, togglesplit
                bindd = , menu, [Utilities] toggle toggle keyboard layout, exec, keyboardswitch.sh

              	bindd = $mainMod, H, [Window Management|Change focus] focus left, movefocus, l
              	bindd = $mainMod, J, [Window Management|Change focus] focus down, movefocus, d
              	bindd = $mainMod, K, [Window Management|Change focus] focus up, movefocus, u
              	bindd = $mainMod, L, [Window Management|Change focus] focus right, movefocus, r

                $moveactivewindow = grep -q "true" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive
                bindde = $mainMod Control, H, [Window Management|Move active window] move left, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l
        	      bindde = $mainMod Control, J, [Window Management|Move active window] move down, exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d
        	      bindde = $mainMod Control, K, [Window Management|Move active window] move up, exec, $moveactivewindow 0 -30 || hyprctl dispatch movewindow u
          	    bindde = $mainMod Control, L, [Window Management|Move active window] move right, exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r

                bindde = $mainMod Shift, H, [Window Management|Resize active window] resize left, resizeactive, -30 0
              	bindde = $mainMod Shift, J, [Window Management|Resize active window] resize down, resizeactive, 0 30
              	bindde = $mainMod Shift, K, [Window Management|Resize active window] resize up, resizeactive, 0 -30
              	bindde = $mainMod Shift, L, [Window Management|Resize active window] resize right, resizeactive, 30 0

                ${config.hyprland.configText}
      '';
    };

    hydenix.hm = {
      dolphin.enable = lib.mkForce true;
      gtk.enable = lib.mkForce true;
      hyde.enable = lib.mkForce true;
      hyprland.enable = lib.mkForce true;
      lockscreen.enable = lib.mkForce true;
      notifications.enable = lib.mkForce true;
      qt.enable = lib.mkForce true;
      rofi.enable = lib.mkForce true;
      screenshots.enable = lib.mkForce true;
      theme = {
        enable = lib.mkForce true;
        active = "Another World";
        themes = [
          "Another World"
          "Catppuccin Mocha"
          "Catppuccin Latte"
          "Code Garden"
        ];
      };
      waybar.enable = lib.mkForce true;
      wlogout.enable = lib.mkForce true;
      xdg.enable = lib.mkForce true;
    };

  };

}
