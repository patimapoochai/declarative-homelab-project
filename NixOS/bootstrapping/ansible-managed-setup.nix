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
    openssh.authorizedKeys.keys = ["ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDA0q2gDymhRsFvwdNSGSKdILAA1n8wC3gVAaE4E/WsogZiATLsYvgUBzWio1ZxdupFZqcG7d2cZeJge4JmzWl+Trz3nYVb/Lj/9jtcXDdWw7bNetpECZ3fl+TIdoJ6ezmjgtrpIFx3waRkjkHhB8Cw6jrqRQuGICKnd31f1fODgKb9b/OkiA06opIMzytVvr5aom57gf7Y4gaDprgQkYaNSMmTBpHAgtMhQJlyaq/cdWhwEv0v56vs8DGQoDSSdYePTC46PxLrUnxuedH5vLmb8Lv8eU98nyPUiv3J9x4aeObdQhTQqIXoE/L6MRSqg7rTX0uwmcu/MYbQB+SC2Zuj0rWB1kfKx5BpmG5adQkExLi3OpPpcw7vFBkFcRJw/zUaSjJ2RxD5VOabk3ZXR7q3v7c32CSQDfj/RgaJ1KKVSeoBf70MZHe3aLVCBzG+pqtOpIm2gy1EQhrC3ev+zk9PpVgVevO0+iEjwQXQWoh71zB+iZTQxJd0bAm4aCpBOr/DvZqPH/PeJXRE1pscRJNCaDPdGX6BcBCV7N8PH3nJwfjNuGJpi7gFlaO1YYgydSFfkj8Td4QWyqiFR3ReB50JE/DRY1tq+gSlz7j5LgsdKGUA0dTqgymOTKyPUwpc1ir6yShuorfpvS2yEi9GxMjPcsLNy9SSmYppqTFptFItNQ=="];
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