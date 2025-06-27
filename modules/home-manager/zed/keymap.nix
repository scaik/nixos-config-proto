{
  lib,
  config,
  ...
}:

{

  config = lib.mkIf config.zed.enable {

    programs.zed-editor.userKeymaps = [
      {
        bindings = {
          ctrl-h = "workspace::ActivatePaneLeft";
          ctrl-j = "workspace::ActivatePaneDown";
          ctrl-k = "workspace::ActivatePaneUp";
          ctrl-l = "workspace::ActivatePaneRight";
        };
      }
      {
        context = "VimControl";
        bindings = {
          ";" = "command_palette::Toggle";
          shift-m = null;
          shift-h = "pane::ActivatePreviousItem";
          shift-l = "pane::ActivateNextItem";
        };
      }
    ];

  };

}
