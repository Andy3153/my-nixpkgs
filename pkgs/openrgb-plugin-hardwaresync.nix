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

origPkg.override { openrgb = my-pkgs.openrgb; }

#(origPkg.override { openrgb = my-pkgs.openrgb; }).overrideAttrs (_:
#{
#  pname   = "openrgb-plugin-hardwaresync";
#  version = "0-unstable-2025-02-25";
#
#  src = pkgs.fetchFromGitLab
#  {
#    owner = "OpenRGBDevelopers";
#    repo  = "OpenRGBHardwareSyncPlugin";
#    rev   = "3a6b65fa1bdc716f88f4a5857b0e61873231363a";
#    hash  = "sha256-lK/14uvsKmUEso0gY135Lpe0s2S3BVFBhZGC4sD9WrY=";
#  };
#
#  meta.description = "${description} (latest Git commit)";
#})
