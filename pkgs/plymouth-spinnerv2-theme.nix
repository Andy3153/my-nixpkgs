# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
{
  stdenvNoCC,
  fetchFromGitHub,
  lib,
  unstableGitUpdater,
}:

stdenvNoCC.mkDerivation rec
{
  themename = "spinnerv2";

  pname   = "plymouth-${themename}-theme";
  version = "sdf";

  #src = /home/andy3153/src/plymouth-themes/plymouth-spinnerv2-theme;

  src = fetchFromGitHub
  {
    owner = "Andy3153";
    repo  = pname;
    rev   = "738c426b5f70a75cf75304cb908149c7af612779";
    hash  = "sha256-3aLUSXqBFbnKRmpV7+NfDJ6CcSGQwbZjOh6oJqS8Ma0=";
  };

  dontBuild = true;

  installPhase =
  ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/${themename}
    cp -r * $out/share/plymouth/themes/${themename}
    substituteInPlace $out/share/plymouth/themes/${themename}/${themename}.plymouth \
      --replace-fail "/usr/" "$out/"

    runHook postInstall
  '';

  passthru.updateScript = unstableGitUpdater { };

  meta =
  {
    description     = "A Plymouth theme loosely based on the default BGRT theme";
    longDescription = "Plymouth theme with the ACPI BGRT graphics on the background, custom elements, spinner animation from adi1090x/plymouth-themes and the NixOS logo at the bottom";
    homepage        = "https://github.com/Andy3153/plymouth-spinnerv2-theme";
    #license         = lib.licenses.gpl3Only;

    maintainers     = with lib.maintainers; [ Andy3153 ];
    platforms       = lib.platforms.linux;
  };
}
