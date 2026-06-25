{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };
}
