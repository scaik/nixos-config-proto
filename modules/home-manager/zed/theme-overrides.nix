{
  lib,
  config,
  ...
}:

{

  config = lib.mkIf config.zed.enable {

    programs.zed-editor.userSettings = {

      "experimental.theme_overrides" = {
        "background.appearance" = "blurred";
        "border" = "#c1c7dc2e";
        "border.variant" = "#00000000";
        "border.focused" = "#b7bdf8";
        "border.selected" = "#c6a0f6";
        "border.transparent" = "#a6da95";
        "border.disabled" = "#6e738d";
        "elevated_surface.background" = "#0a0a0a";
        "surface.background" = "#000000d0";
        "background" = "#0a0c12d7";
        "element.background" = "#181926";
        "element.hover" = "#494d644d";
        "element.active" = "#00000000";
        "element.selected" = "#363a4f4d";
        "element.disabled" = "#6e738d";
        "drop_target.background" = "#f4dbd618";
        "ghost_element.background" = "#00000000";
        "ghost_element.hover" = "#f4dbd608";
        "ghost_element.active" = "#f4dbd612";
        "ghost_element.selected" = "#f4dbd612";
        "ghost_element.disabled" = "#6e738d";
        "text" = "#cad3f5";
        "text.muted" = "#b8c0e0";
        "text.placeholder" = "#5b6078";
        "text.disabled" = "#494d64";
        "text.accent" = "#c6a0f6";
        "icon" = "#cad3f5";
        "icon.muted" = "#8087a2";
        "icon.disabled" = "#6e738d";
        "icon.placeholder" = "#5b6078";
        "icon.accent" = "#c6a0f6";
        "status_bar.background" = "#000000d7";
        "title_bar.background" = "#000000d7";
        "title_bar.inactive_background" = "#181926d9";
        "toolbar.background" = "#00000000";
        "tab_bar.background" = "#00000000";
        "tab.inactive_background" = "#00000000";
        "search.match_background" = "#8bd5ca33";
        "panel.background" = "#00000000";
        "panel.focused_border" = "00000000";
        "panel.indent_guide" = "#363a4f99";
        "panel.indent_guide_active" = "#5b6078";
        "panel.indent_guide_hover" = "#c6a0f6";
        "pane.focused_border" = "#cad3f5";
        "pane_group.border" = "#363a4f";
        "scrollbar.thumb.background" = "#f4dbd612";
        "scrollbar.thumb.hover_background" = "#6e738d";
        "scrollbar.track.background" = "#00000000";
        "scrollbar.track.border" = "#00000000";
        "editor.foreground" = "#cad3f5";
        "editor.background" = "#00000000";
        "editor.gutter.background" = "#00000000";
        "editor.subheader.background" = "#1e2030";
        "editor.active_line.background" = "#00000000";
        "editor.highlighted_line.background" = "#f4dbd612";
        "editor.invisible" = "#939ab766";
        "editor.indent_guide" = "#363a4f99";
        "editor.indent_guide_active" = "#5b6078";
        "terminal.background" = "#00000000";
        "syntax" = {
          keyword.color = "#fead65ff";
          function.color = "#ffd173ff";
        };
      };

    };

  };

}
