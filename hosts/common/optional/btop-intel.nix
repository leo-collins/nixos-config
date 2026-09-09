{ config, ... }:

# btop can show intel integrated GPU stats, but needs to be run
# as root to do so. This wraps the btop command to run as root.
# This should only be imported on systems using intel integrated graphics.
# https://github.com/aristocratos/btop/issues/644

{
  security.wrappers.btop = {
    owner = "root";
    group = "root";
    source = "${config.home-manager.users.leo.programs.btop.package}/bin/btop";
    capabilities = "cap_perfmon,cap_dac_read_search+ep";
  };
}
