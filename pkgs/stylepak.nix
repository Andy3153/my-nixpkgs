{
  stdenvNoCC,
  fetchFromGitHub,
  lib,

  ostree,
  appstream-glib
}:

stdenvNoCC.mkDerivation rec
{
  pname   = "stylepak";
  version = "0c4b0c1";

  buildInputs =
  [
    ostree
    appstream-glib
  ];

  src = fetchFromGitHub
  {
    owner = "refi64";
    repo  = "stylepak";
    rev   = "0c4b0c1c6d893d6c3a38e7dc828a686b7a4a5e45";
    hash  = "sha256-IdJMPG/4RcgOUilTQjkAcKa/RkZaz0R4UUPDBIW7Vwo=";
  };

  dontBuild = true;

  installPhase =
  ''
    runHook preInstall

    mkdir -p $out/bin
    cp stylepak $out/bin

    runHook postInstall
  '';

  meta =
  {
    description     = "Automatically install your host GTK+ theme as a Flatpak";
    longDescription = meta.description;
    homepage        = "https://github.com/refi64/stylepak";
    license         = lib.licenses.mpl20;

    mainProgram     = "stylepak";
    maintainers     = with lib.maintainers; [ Andy3153 ] ;
    platforms       = lib.platforms.all;
  };
}
