{ inputs, stateVersion, hostName, ... }:

{

  imports = [
    ./../../modules/system

    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.gigabyte-b550
  ];

  hardware = {
    graphics.enable = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  hydenix = {
    hostname = hostName;
    timezone = "Europe/Moscow";
    locale = "en_US.UTF-8";
  };

  system.stateVersion = stateVersion;

}
