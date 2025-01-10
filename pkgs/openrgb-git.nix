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
  version = "0-unstable-2025-01-10";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "59e303c882096cc04d635740b77f330744e168e4";
    hash  = "sha256-ChOmRukf+uGHbha75q/PphkeGFGGvKCoFZw26fldFtE=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';

  meta.description = "Open source RGB lighting control (latest Git commit)";
})
