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
  description = pkgs.openrgb-plugin-effects.meta.description;
in
(pkgs.openrgb-plugin-effects.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
{
  pname   = "openrgb-plugin-effects-git";
  version = "0-unstable-2025-02-07";

  src = pkgs.fetchFromGitLab
  {
    owner = "OpenRGBDevelopers";
    repo  = "OpenRGBEffectsPlugin";
    rev   = "188bfc135df42e96a0658dc021204e08676b3025";
    hash  = "sha256-HQdk262k5QuW4RK4LTsVdNOI4WPEGvQl5hUfh7RtErE=";
  };

  meta.description = "${description} (latest Git commit)";
})
