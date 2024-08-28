# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
{
  python3Packages,
  fetchFromGitHub,
  lib,
  pkgs,

  rev  ? null,
  hash ? null,
}:

python3Packages.buildPythonApplication rec
{
  pname   = "waybar-weather";
  version = "nover";
  format  = "other";

  propagatedBuildInputs = with pkgs.python3Packages;
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
    cp dotconfig/waybar/scripts/weather.py $out/bin/waybar-weather
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
