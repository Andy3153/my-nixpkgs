## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## BeamMP Launcher
##
## https://github.com/BeamMP/BeamMP-Launcher
##

{
  stdenv,
  fetchFromGitHub,
  lib,

  cmake,
  vcpkg,
  curl,
  httplib,
  openssl,
  nlohmann_json
}:

stdenv.mkDerivation rec
{
  pname   = "beammp-launcher";
  version = "2.4.0";

  src = fetchFromGitHub
  {
    owner = "BeamMP";
    repo  = pname;
    rev   = "v${version}";
    hash  = "sha256-aAQmgK03a3BY4YWuDyTmJzcePchD74SXfbkHwnaOYW8=";
  };

  nativeBuildInputs =
  [
    cmake
    vcpkg
    curl
    httplib
    openssl
    nlohmann_json
  ];

  cmakeBuildType = "Release";

  installPhase =
  ''
    mkdir -p $out/bin
    install -Dm755 BeamMP-Launcher $out/bin
  '';

  meta =
  {
    description = "Official BeamMP Launcher.";
    homepage    = "https://github.com/BeamMP/${pname}";
    license     = lib.licenses.agpl3Only;
    mainProgram = "BeamMP-Launcher";

    maintainers = [ lib.maintainers.Andy3153 ];
    platforms   = lib.platforms.linux;
  };
}
