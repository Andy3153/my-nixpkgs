## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB
##
## https://gitlab.com/CalcProgrammer1/OpenRGB
##

{
  lib,
  pkgs,
}:

pkgs.openrgb-with-all-plugins.overrideAttrs (_:
{
  pname   = "openrgb-git";
  version = "0-unstable-2024-10-16";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "bdfd2a3290d3a7acce39b3c3fe9f537d802c75d0";
    hash  = "sha256-1UivhakzXzvDIgkUD2xv6gKwC61sR0nOugldeJoyyYY=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "Open source RGB lighting control (latest Git commit)";
})
