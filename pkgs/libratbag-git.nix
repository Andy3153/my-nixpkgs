## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## Libratbag
##
## https://github.com/libratbag/libratbag
##

{
  pkgs,
}:

pkgs.libratbag.overrideAttrs (_:
{
  pname   = "libratbag-git";
  version = "0-unstable-2025-01-10";

  src = pkgs.fetchFromGitHub
  {
    owner = "libratbag";
    repo  = "libratbag";
    rev   = "df3c73e95841273908410ed1c563d8ed4ec21edd";
    hash  = "sha256-hI6Xu1RtyJsNga7BaMjQixnyv/V5qkp75FAFcqrvaHE=";
  };

  meta.description = "Configuration library for gaming mice (latest Git commit)";
})
