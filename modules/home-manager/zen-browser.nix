{ inputs, pkgs, lib, config, ... }:

let
  hydeExtensions = pkgs.fetchzip {
    url =
      "https://github.com/HyDE-Project/HyDE/raw/aa49b3f2f18b54e775dd5389551569fe81ebd56a/Source/arcs/Firefox_Extensions.tar.gz";
    sha256 = "sha256-eeKzo6Ff/rXTlau5F4LSrM+Bfl+mhgR42B19dzmacJc=";
  };
  hydeConfig = pkgs.fetchzip {
    url =
      "https://github.com/HyDE-Project/HyDE/raw/aa49b3f2f18b54e775dd5389551569fe81ebd56a/Source/arcs/Firefox_UserConfig.tar.gz";
    sha256 = "sha256-M/+5HF/kUvSDf6fuFwcJUv2RK58/jEDd94BaLbXHVFw=";
    stripRoot = false;
  };
in {

  imports = [ inputs.zen-browser.homeModules.beta ];

  options.zen-browser.enable = lib.mkEnableOption "Enable zen-browser module";

  config = lib.mkIf config.zen-browser.enable {

    home.sessionVariables = { MOZ_ENABLE_WAYLAND = "1"; };

    programs.zen-browser = {
      enable = true;
      policies = { DisableTelemetry = true; };
    };

    home.activation.installHydeFirefoxConfig =
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        # Get the default profile directory
        PROFILE_DIR=$(find ~/.zen -name "*.Default Profile" -type d 2>/dev/null || echo "")
        if [ -z "$PROFILE_DIR" ]; then
          echo "No default Zen Browser profile found. Creating one may require running Zen first."
        else
          $DRY_RUN_CMD chmod -R u+rw "$PROFILE_DIR"

          # Create chrome directory if it doesn't exist
          $DRY_RUN_CMD mkdir -p $VERBOSE_ARG "$PROFILE_DIR/chrome"
          
          # Install extensions
          $DRY_RUN_CMD cp -r $VERBOSE_ARG ${hydeExtensions}/* "$PROFILE_DIR/extensions/"
          
          # Install userChrome.css
          $DRY_RUN_CMD cp -r $VERBOSE_ARG ${hydeConfig}/chrome/* "$PROFILE_DIR/chrome/"
          
          # Install user.js
          $DRY_RUN_CMD cp -r $VERBOSE_ARG ${hydeConfig}/user.js "$PROFILE_DIR/"
        fi
      '';

  };

}
