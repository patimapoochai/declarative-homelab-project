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
    openssh.authorizedKeys.keys = [""]; # Add with ansible lineinfile module
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
