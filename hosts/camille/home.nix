{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/ghostty.nix
    ../../modules/home-manager/niri.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/zed-editor.nix

    inputs.niri.homeModules.niri
    inputs.zen-browser.homeModules.default
    inputs.dankmaterialshell.homeModules.dankMaterialShell
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "poilk";
  home.homeDirectory = "/home/poilk";

  home.stateVersion = "25.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.ghostty
    pkgs.fastfetch
    pkgs.starship
    pkgs.bibata-cursors
    pkgs.yazi
    pkgs.zed-editor
  ];

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    
    name = "Bibata-Modern-Ice";
    size = 24;
    package = pkgs.bibata-cursors;
  };

  # Enable Niri
  programs.niri.enable = true;

  # Enable Zen
  programs.zen-browser.enable = true;

  # Enable DankMaterialShell
  programs.dankMaterialShell = {
    enable = true;
    enableKeybinds = true;      
    enableSystemd = false;      
    enableSpawn = true;        
  };

  # Vulkan support
  nixGL.vulkan.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
