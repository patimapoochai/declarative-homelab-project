{
  sops.defaultSopsFile = ../../../secrets/nixos.yml;
  sops.defaultSopsFormat = "yaml";

  # This will automatically import SSH keys as age keys
  sops.age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

  # This is the actual specification of the secrets.
  sops.secrets."nixos/openssh_authorizedkey" = {};
  sops.secrets."nixos/k3s/token" = {};
  sops.secrets."nixos/k3s/serverAddr" = {};
}