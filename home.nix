{ config, pkgs, ... }:

{
  home.username = "stivscience";
  home.homeDirectory = "/home/stivscience";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    tmux
    alacritty
    firefox
  ];
}
