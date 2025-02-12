## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB with all plugins
##
## https://gitlab.com/CalcProgrammer1/OpenRGB
##

{
  my-pkgs
}:

my-pkgs.openrgb-git.withPlugins
[
  my-pkgs.openrgb-plugin-effects-git
  my-pkgs.openrgb-plugin-hardwaresync-git
]
