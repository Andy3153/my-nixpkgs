## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB
##
## https://gitlab.com/CalcProgrammer1/OpenRGB
##

{
  lib,
  pkgs,
  my-pkgs
}:

let
  description = pkgs.openrgb.meta.description;
in
(pkgs.openrgb.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
{
  pname   = "openrgb-git";
  version = "0-unstable-2025-02-12";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "d1cdea47c797ecf669ae1a5420e33c80a79558ba";
    hash  = "sha256-SlkstIMQL1YO1EjeEiBrbikpj9muusVxQJlE1TD/mjQ=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "${description} (latest Git commit)";
})
