## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Syrics
##
## https://github.com/akashrchandran/syrics
## https://pypi.org/project/syrics/
##

{
  python3Packages,
  fetchPypi,
  lib,
}:

python3Packages.buildPythonApplication rec
{
  pname   = "syrics";
  version = "0.0.1.8";

  pyproject    = true;
  build-system = [ python3Packages.setuptools ];

  dependencies = with python3Packages;
  [
    requests
    spotipy
    tinytag
    tqdm
  ];

  src = fetchPypi
  {
    inherit pname version;
    hash = "sha256-u/icaT2jMNS+Eip0HW23ECRGunEext4rtwIGBdwo2us=";
  };

  meta =
  {
    description     = "A command line tool to fetch lyrics from spotify and save it to lrc file.";
    longDescription =
    ''
      A command line tool to fetch lyrics from spotify and save it to lrc file. It can fetch both synced and unsynced lyrics from spotify.

      You can find API version at https://github.com/akashrchandran/spotify-lyrics-api.
    '';
    homepage        = "https://github.com/akashrchandran/${pname}";
    license         = lib.licenses.gpl3;

    mainProgram     = pname;
    maintainers     = with lib.maintainers; [ Andy3153 ] ;
    platforms       = lib.platforms.all;
  };
}
