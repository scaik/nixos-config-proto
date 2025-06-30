{ pkgs, lib, config, ... }:

{

  options.ollama = {
    enable = lib.mkEnableOption "Enable ollama module";
    modelSize = lib.mkOption {
      default = "14b";
      type = lib.types.str;
      description = "Model size";
    }; 
  };

  config = lib.mkIf config.ollama.enable {

    services.ollama = {
      enable = true;
      loadModels = ["deepseek-r1:${config.ollama.modelSize}" "qwen3:${config.ollama.modelSize}"];
      acceleration = "cuda";
    };

  };

}
