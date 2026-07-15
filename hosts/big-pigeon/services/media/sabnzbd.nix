{ ... }:

{
  services.sabnzbd = {
    enable = true;
    allowConfigWrite = true;  # Ideally use sops-nix for secrets
    openFirewall = true;
    group = "media";

    settings = {
      misc = {
        bandwidth_max = "30MB/s";
        bandwidth_perc = 80;
        cache_limit = "1000M";
        host = "0.0.0.0";
        port = 8080;
        no_smart_dupes = 4;  # tag duplicate jobs
        propagation_delay = 5;
        download_dir = "/tank/media/usenet/incomplete";
        complete_dir = "/tank/media/usenet/complete";
        nzb_backup_dir = "/tank/media/usenet/nzb-backup";
        direct_unpack = 1;
        unwanted_extensions = "ade, adp, app, application, appref-ms, asp, aspx, asx, bas, bat, bgi, cab, cer, chm, cmd, cnt, com, cpl, crt, csh, der, diagcab, exe, fxp, gadget, grp, hlp, hpj, hta, htc, inf, ins, iso, isp, its, jar, jnlp, js, jse, ksh, lnk, mad, maf, mag, mam, maq, mar, mas, mat, mau, mav, maw, mcf, mda, mdb, mde, mdt, mdw, mdz, msc, msh, msh1, msh2, mshxml, msh1xml, msh2xml, msi, msp, mst, msu, ops, osd, pcd, pif, pl, plg, prf, prg, printerexport, ps1, ps1xml, ps2, ps2xml, psc1, psc2, psd1, psdm1, pst, py, pyc, pyo, pyw, pyz, pyzw, reg, scf, scr, sct, shb, shs, sln, theme, tmp, url, vb, vbe, vbp, vbs, vcxproj, vhd, vhdx, vsmacros, vsw, webpnp, website, ws, wsc, wsf, wsh, xbap, xll, xnk";
        action_on_unwanted_extensions = 2;  # Fail job (move to history)
      };

      servers.newshosting = {
        displayname = "Newshosting";
        enable = true;
        host = "news.newshosting.com";
        name = "Newshosting";
        port = 563;
        ssl = true;
      };
    };
  };

  # Make newly created files be writable by `media`
  systemd.services.sabnzbd.serviceConfig.UMask = "0002";
}
