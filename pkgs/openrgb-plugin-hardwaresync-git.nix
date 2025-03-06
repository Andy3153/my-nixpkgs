## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB Hardware Sync Plugin
##
## https://gitlab.com/OpenRGBDevelopers/OpenRGBHardwareSyncPlugin
##

{
  pkgs,
  my-pkgs
}:

let
  origPkg     = pkgs.openrgb-plugin-hardwaresync;
  description = origPkg.meta.description;
in
origPkg.override { openrgb = my-pkgs.openrgb-git; }

#(origPkg.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
#{
#  pname   = "openrgb-plugin-hardwaresync-git";
#  version = "0-unstable-2025-02-25";
#
#  src = pkgs.fetchFromGitLab
#  {
#    owner = "OpenRGBDevelopers";
#    repo  = "OpenRGBHardwareSyncPlugin";
#    rev   = "3a6b65fa1bdc716f88f4a5857b0e61873231363a";
#    hash  = "sha256-HhREYstjUIe0QWjFwLJ0Q8iJLjFvFrEAJ31MpZtPLq8=";
#  };
#
#  postPatch =
#  ''
#    rm -rf OpenRGB
#    ln -s ${my-pkgs.openrgb-git.src} OpenRGB
#    rm -rf dependencies/lhwm-cpp-wrapper
#  '';
#
#  meta.description = "${description} (latest Git commit)";
#})
