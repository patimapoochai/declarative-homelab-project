{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    git
    age
    sops
    tmux
  ];
}