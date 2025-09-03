{
  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs";
    comin = {
      url = "github:nlewo/comin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, comin }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem { # change this variable name to the name of the machine
        system = "x86_64-linux";
        modules = [
          comin.nixosModules.comin
          ({...}: {
            services.comin = {
              enable = true;
              remotes = [{
                name = "origin";
                url = "https://github.com/patimapoochai/declarative-homelab-project.git";
                branches.main.name = "comin";
              }];
            };
          })

          ./configuration.nix
        ];
      };
    };
  };
}