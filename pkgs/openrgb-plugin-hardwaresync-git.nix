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
  description = pkgs.openrgb-plugin-hardwaresync.meta.description;
in
(pkgs.openrgb-plugin-hardwaresync.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
{
  pname   = "openrgb-plugin-hardwaresync-git";
  version = "0-unstable-2025-02-07";

  src = pkgs.fetchFromGitLab
  {
    owner = "OpenRGBDevelopers";
    repo  = "OpenRGBHardwareSyncPlugin";
    rev   = "506f206fc14a6967528158c9ac1376c9463549e6";
    hash  = "sha256-pMIc5WK/cum8tJ2LwIlQ8WkzgssO8pkFzCJ5wQLoZHg=";
  };

  postPatch =
  ''
    rm -rf OpenRGB
    ln -s ${my-pkgs.openrgb-git.src} OpenRGB
    rm -r dependencies/lhwm-cpp-wrapper
  '';

  meta.description = "${description} (latest Git commit)";
})
