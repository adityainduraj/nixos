{
  config,
  pkgs,
  lib,
  ...
}: {

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if ((action.id == "org.libvirt.unix.manage" ||
           action.id == "org.libvirt.api.authenticate") &&
          subject.isInGroup("libvirt")) {
        return polkit.Result.YES;
      }
    });
  '';
}
