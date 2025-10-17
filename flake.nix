{
  description = "Configurations for home lab machines";
  # this is here just to point NixOS to the correct configs in the ./NixOS folder

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, sops-nix ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./NixOS/nixos/configuration.nix
        sops-nix.nixModules.sops
      ];
    };

  };
}