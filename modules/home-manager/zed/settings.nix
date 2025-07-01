{ lib, config, ... }:

{

  config = lib.mkIf config.zed.enable {

    programs.zed-editor.userSettings = {
      telemetry.metrics = false;
      features.edit_prediction_provider = "zed";

      languages.Python = {
        language_servers = [
          "basedpyright"
          "ruff"
          "!pyright"
        ];
        format_on_save = "on";
        formatter = [
          {
            external = {
              command = "ruff";
              arguments = [
                "format"
                "-"
              ];
            };
          }
          {
            code_actions = {
              "source.fixAll.ruff" = true;
              "source.organizeImports.ruff" = true;
            };
          }
        ];
      };

      vim_mode = true;
      relative_line_numbers = true;

      ui_font_size = 16;
      buffer_font_size = 14;
      ui_font_family = ".SystemUIFont";
      buffer_font_family = "Fira Code";

      cursor_blink = false;
      show_wrap_guides = true;
      wrap_guides = [ 120 ];

      scrollbar.show = "never";
      minimap = {
        show = "always";
        thumb_border = "none";
      };

      git = {
        git_gutter = "tracked_files";
        inline_blame.enable = true;
      };

      theme = {
        mode = "system";
        light = "Ayu Light";
        dark = "KTRZ Monokai";
      };
      icon_theme = "Material Icon Theme";

      inlay_hints.enabled = true;

      languages = {
        JavaScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            source.fixAll.biome = true;
            source.organizeImports.biome = true;
          };
        };
        TypeScript = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            source.fixAll.biome = true;
            source.organizeImports.biome = true;
          };
        };
        JSX = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            source.fixAll.biome = true;
            source.organizeImports.biome = true;
          };
        };
        TSX = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
          code_actions_on_format = {
            source.fixAll.biome = true;
            source.organizeImports.biome = true;
          };
        };
        JSON = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
        };
        JSONC = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
        };
        CSS = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
        };
        GraphQL = {
          formatter = {
            language_server = {
              name = "biome";
            };
          };
        };
      };

    };

  };

}
