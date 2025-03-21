## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB Effects Plugin
##
## https://gitlab.com/OpenRGBDevelopers/OpenRGBEffectsPlugin
##

{
  pkgs,
  my-pkgs
}:

let
  origPkg     = pkgs.openrgb-plugin-effects;
  description = origPkg.meta.description;
in

origPkg.override { openrgb = my-pkgs.openrgb; }

#(origPkg.override { openrgb = my-pkgs.openrgb; }).overrideAttrs (_:
#{
#  pname   = "openrgb-plugin-effects";
#  version = "0-unstable-2025-03-07";
#
#  src = pkgs.fetchFromGitLab
#  {
#    owner = "OpenRGBDevelopers";
#    repo  = "OpenRGBEffectsPlugin";
#    rev   = "9234e358b20ad83d3249ad13a8765fc192a965f5";
#    hash  = "sha256-kuvLZx5zMpNgoHIinIvx6/tC6G0HoYdIESNu/rC0nlc=";
#  };
#
#  meta.description = "${description} (latest Git commit)";
#})
