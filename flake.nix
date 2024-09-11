{
  description = "Andy3153's collection of packages for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
  {
    packages.x86_64-linux =
    let
      # {{{ Variables
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      # }}}
    in
    {
      batnotifsd               = pkgs.callPackage ./pkgs/batnotifsd.nix               { };
      libratbag-git            = pkgs.callPackage ./pkgs/libratbag-git.nix            { };
      openrgb-git              = pkgs.callPackage ./pkgs/openrgb-git.nix              { };
      piper-git                = pkgs.callPackage ./pkgs/piper-git.nix                { };
      plymouth-spinnerv2-theme = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix { };
      weather4bar              = pkgs.callPackage ./pkgs/weather4bar.nix              { };
    };
  };
}
