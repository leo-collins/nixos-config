{ ... }:

{
  users.users.leo = {
    isNormalUser = true;
    description = "Leo";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
