# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
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
    rev   = "a6758252249f72ea785182e5b2cd1075c904d81b";
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
