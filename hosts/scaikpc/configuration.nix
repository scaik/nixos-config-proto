{ inputs, stateVersion, hostName, pkgs, ... }:

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
    i2c.enable = true;
  };

  hydenix = {
    hostname = hostName;
    timezone = "Europe/Moscow";
    locale = "en_US.UTF-8";
  };

  services.hardware.openrgb.enable = true;

  services.udev.packages = with pkgs; [ openrgb ];

  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins
    android-studio
  ];
  
  boot.kernelModules = [
    "i2c-dev"
    "i2c-piix4"
  ];

  boot.kernelParams = [ "acpi_enforce_resources=lax" ];

  system.stateVersion = stateVersion;

}
