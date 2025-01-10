## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Piper
##
## https://github.com/libratbag/piper
##

{
  pkgs,
}:

pkgs.piper.overrideAttrs (_:
{
  pname   = "piper-git";
  version = "0-unstable-2025-01-10";

  src = pkgs.fetchFromGitHub
  {
    owner = "libratbag";
    repo  = "piper";
    rev   = "3e5a6b96d09f7a65242ba90cbfbba64fc673b9ff";
    hash  = "sha256-e0Ti8PfH/op+LquEi/5Rjv8zO8Z49m1S2QNHL5XXajc=";
  };

  mesonFlags = [ "-Druntime-dependency-checks=false" ];

  meta.description = "GTK frontend for ratbagd mouse config daemon (latest Git commit)";
})
