{ config, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      window-padding-x = 10;
      window-padding-y = 10;
      cursor-style = "bar";
      shell-integration = "fish";
    };
  };
}
