{ config, pkgs, ... }:

{
  imports = [
    ./ansible-managed-setup.nix
    ./k3s.nix
    ./prometheus-node-exporter.nix
    ./admin-utils.nix
    ./sops.nix
  ];
}
