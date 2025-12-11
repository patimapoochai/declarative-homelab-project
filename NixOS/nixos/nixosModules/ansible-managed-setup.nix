{ config, pkgs, ... }:

{
  # make sure python3 is installed
	environment.systemPackages = [
    pkgs.python3
  ];

  # create "ansible" user
  users.users.ansible = {
    isNormalUser = true;
    home = "/home/ansible";
  };

  # configure authorized ssh keys for ansiber user
  sops.secrets."nixos/openssh_authorizedkey" = {
    owner = "ansible";
    mode = "0600";
    path = "/home/ansible/.ssh/authorized_keys";
  };

  # set up sudo
  security.sudo = {
    enable = true;
    extraRules = [
      {
        users = [ "ansible" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };


  # allow access via ansible user
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = ["ansible"];
      PermitRootLogin = "prohibit-password";
    };
  };
}
