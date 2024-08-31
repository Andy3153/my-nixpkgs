# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
{
  lib,
  pkgs,
}:

pkgs.openrgb-with-all-plugins.overrideAttrs (_:
{
  pname   = "openrgb-git";
  version = "0-unstable-2024-08-30";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "406350f5f5e3f3362a7a0b7e786647fbc17a98c9";
    hash  = "sha256-XuC9HHWdvNH6QJYE1G5cY+/N9n2nXAIvZ07AdMtZQIw=";
  };

  postPatch =
  ''
    patchShebangs scripts/build-udev-rules.sh
    substituteInPlace scripts/build-udev-rules.sh \
      --replace "/usr/bin/env chmod" "${lib.getExe' pkgs.coreutils "chmod"}"
  '';
})
