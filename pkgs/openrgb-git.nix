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
  version = "0-unstable-2024-09-05";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "c84932df4625b9f8028b0352ce5d7247de8099c1";
    hash  = "sha256-2jh0pORY3kz0zf1pzAgWOMRnWbwhzl1y509fh21RYSE=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "Open source RGB lighting control (latest Git commit)";
})
