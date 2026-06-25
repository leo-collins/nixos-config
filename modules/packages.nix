{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    git
    wget
    curl
    vim
  ];
}
