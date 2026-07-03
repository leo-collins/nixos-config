{ ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General.FastConnectable = true;
      Policy.ReconnectAttempts = 10;
    };
  };
}
