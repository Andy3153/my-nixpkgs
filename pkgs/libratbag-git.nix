# vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
{
  pkgs,
}:

pkgs.libratbag.overrideAttrs (_:
{
  pname   = "libratbag-git";
  version = "0-unstable-2024-06-04";

  src = pkgs.fetchFromGitHub
  {
    owner = "libratbag";
    repo  = "libratbag";
    rev   = "1c9662043f4a11af26537e394bbd90e38994066a";
    hash  = "sha256-IpN97PPn9p1y+cAh9qJAi5f4zzOlm6bjCxRrUTSXNqM=";
  };

  meta.description = "Configuration library for gaming mice (latest Git commit)";
})
