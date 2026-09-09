{ ... }:

# Enable zswap
# zswap sits in front of disk swap. When a process needs to swap,
# zswap intercepts and compresses the page in RAM. It then evicts
# them to disk swap when its cache fills up.
# NOTE: you need to have regular disk swap to use zswap!

{
  boot.zswap = {
    enable = true;
    # the compression algorithm to use
    compressor = "zstd";
    # the shrinker reclaims memory when under pressure
    shrinkerEnabled = true;
    # max percentage of memory that zswap can occupy
    maxPoolPercent = 25;
    # percentage at which zswap starts accepting pages again after becoming full
    acceptThresholdPercent = 90;
  };
}
