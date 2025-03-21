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
  origPkg     = pkgs.openrgb;
  description = origPkg.meta.description;
in

(origPkg.override { openrgb = my-pkgs.openrgb; }).overrideAttrs (_: rec
{
  pname   = "openrgb";
  version = "1.0rc1";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "release_candidate_${version}";
    hash  = "sha256-jKAKdja2Q8FldgnRqOdFSnr1XHCC8eC6WeIUv83e7x4=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "${description} (1.0 RC1)";
})
