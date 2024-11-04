## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Weather for status bar
##
## https://github.com/Andy3153/weather4bar
## https://pypi.org/project/weather4bar/
##

{
  python3Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonApplication rec
{
  pname   = "weather4bar";
  version = "1.0.2";

  pyproject    = true;
  build-system = [ python3Packages.hatchling ];

  dependencies = with python3Packages;
  [
    requests
  ];

  src = fetchPypi
  {
    inherit pname version;
    hash = "sha256-INtO+MBTYMGmDIQIqSybeqvBg691CgxRvwxEPAGEV9A=";
  };

  postInstall =
  ''
    mkdir -p $out/bin
    mv $out/lib/python*/site-packages/${pname}/${pname}.py $out/bin/${pname}
    rm -rf $out/lib
  '';

  meta =
  {
    description     = "A Python script that shows weather info for the current location.";
    longDescription =
    ''
      This is a Python script that shows weather info for the current location.

      It's useful for putting into your window manager bar, or just for calling it from your terminal.
    '';
    homepage        = "https://github.com/Andy3153/${pname}";
    license         = lib.licenses.gpl2;

    mainProgram     = pname;
    maintainers     = with lib.maintainers; [ Andy3153 ] ;
    platforms       = lib.platforms.all;
  };
}
