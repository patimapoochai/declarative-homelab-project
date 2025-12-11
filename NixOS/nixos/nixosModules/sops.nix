{ config, pkgs, ... }:

{
  sops.defaultSopsFile = ../../../sops-secrets/nixos.yml;
  sops.defaultSopsFormat = "yaml";

  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
}
