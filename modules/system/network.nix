{ lib, config, ... }:

{

  options.network.enable = lib.mkEnableOption "Enable network module";

  config = lib.mkIf config.network.enable {

    hydenix.network.enable = lib.mkForce true;

    networking.firewall.allowedTCPPorts = lib.mkForce [ ];
    networking.firewall.allowedUDPPorts = lib.mkForce [ ];

  };

}
