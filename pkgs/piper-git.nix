# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
{
  pkgs,
}:

pkgs.piper.overrideAttrs (_:
{
  pname   = "piper-git";
  version = "0-unstable-2024-08-23";

  src = pkgs.fetchFromGitHub
  {
    owner = "libratbag";
    repo  = "piper";
    rev   = "93a5a004766e37a801940cc3317c4aea9d2a6cfd";
    hash  = "sha256-a+HBxFYzRfcLPR7Ut+sFEh9Aj8b+Xbqhp6TGGCVbCb8=";
  };

  mesonFlags = [ "-Druntime-dependency-checks=false" ];
})
