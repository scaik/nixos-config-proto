{
  pkgs,
  lib,
  config,
  ...
}:

{

  imports = [
    ./keymap.nix
    ./settings.nix
    ./theme-overrides.nix
  ];

  options.zed.enable = lib.mkEnableOption "Enable zed module";

  config = lib.mkIf config.zed.enable {

    home.packages = with pkgs; [
      basedpyright
      nil
      nixd
      ruff
      rust-analyzer
      rustfmt
    ];

    programs.zed-editor = {
      enable = true;
      extensions = [
        "ayu-darker"
        "basedpyright"
        "biome"
        "codebook"
        "dockerfile"
        "html"
        "ktrz-monokai"
        "material-icon-theme"
        "nix"
        "ruff"
        "toml"
      ];
    };

  };

}
