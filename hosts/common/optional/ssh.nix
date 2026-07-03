{ ... }:

{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings.PermitRootLogin = "no";
  };

  users.users.leo.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN2W1D1FLIjymY8HlxS4DyP9wrk/vLjouxuHaBHFDY/+ lac224@IC-X149F9H0WT"
  ];
}
