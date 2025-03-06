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
  origPkg     = pkgs.openrgb-plugin-effects;
  description = origPkg.meta.description;
in
origPkg.override { openrgb = my-pkgs.openrgb-git; }

#(origPkg.override { openrgb = my-pkgs.openrgb-git; }).overrideAttrs (_:
#{
#  pname   = "openrgb-plugin-effects-git";
#  version = "0-unstable-2025-02-28";
#
#  src = pkgs.fetchFromGitLab
#  {
#    owner = "OpenRGBDevelopers";
#    repo  = "OpenRGBEffectsPlugin";
#    rev   = "e0147bbe0451eb1758e290146e3092f49b09cf7c";
#    hash  = "sha256-HhREYstjUIe0QWjFwLJ0Q8iJLjFvFrEAJ31MpZtPLq8=";
#  };
#
#  nativeBuildInputs = origPkg.nativeBuildInputs ++
#  [
#    pkgs.git
#  ];
#
#  postPatch =
#  ''
#    rm -rf OpenRGB
#    ln -s ${my-pkgs.openrgb-git.src} OpenRGB
#  '';
#
#  meta.description = "${description} (latest Git commit)";
#})
