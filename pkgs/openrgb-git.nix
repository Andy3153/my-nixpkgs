## vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
##
## OpenRGB
##
## https://gitlab.com/CalcProgrammer1/OpenRGB
##

{
  pkgs,
}:

let
  description = pkgs.openrgb.meta.description;
in
pkgs.openrgb.overrideAttrs (_:
{
  pname   = "openrgb-git";
  version = "0-unstable-2025-02-11";

  src = pkgs.fetchFromGitLab
  {
    owner = "CalcProgrammer1";
    repo  = "OpenRGB";
    rev   = "f8b8da47a3df4efe7e2a44965f58b2e52330ecaa";
    hash  = "sha256-MvsrE9Qj7RS6cK2l+UBjW5WxjMs9ZmxqNZDEG1EvqAQ=";
  };

  meta.description = "${description} (latest Git commit)";
})
