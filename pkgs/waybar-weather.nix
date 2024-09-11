## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Waybar Weather script
##
## https://github.com/Andy3153/hyprland-rice
##

{
  python3Packages,
  fetchFromGitHub,
  lib,

  rev  ? null,
  hash ? null,
}:

python3Packages.buildPythonApplication rec
{
  pname   = "waybar-weather";
  version = "nover";
  format  = "other";

  dependencies = with python3Packages;
  [
    requests
  ];

  src = fetchFromGitHub
  {
    owner = "Andy3153";
    repo  = "hyprland-rice";
    rev   = rev;
    hash  = hash;
  };

  installPhase =
  ''
    mkdir -p $out/bin
    cp $src/dotconfig/waybar/scripts/weather.py $out/bin/waybar-weather
  '';

  meta =
  {
    description     = "My weather script for Waybar";
    longDescription = meta.description;
    homepage        = "https://github.com/Andy3153/hyprland-rice";
    license         = lib.licenses.gpl2;

    mainProgram     = "waybar-weather";
    maintainers     = with lib.maintainers; [ Andy3153 ] ;
    platforms       = lib.platforms.all;
  };
}
