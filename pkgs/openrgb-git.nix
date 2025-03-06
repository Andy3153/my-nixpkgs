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
(origPkg.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
{
  pname   = "openrgb-git";
  version = "0-unstable-2025-03-05";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "3ce3447b655b5381291b48a09d5ffe03606619da";
    hash  = "sha256-HhREYstjUIe0QWjFwLJ0Q8iJLjFvFrEAJ31MpZtPLq8=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "${description} (latest Git commit)";
})
