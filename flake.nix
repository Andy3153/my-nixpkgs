{
  description = "Andy3153's collection of packages for Nix";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
  let
    # {{{ Variables
  supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
  forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
    # }}}
  in
  {
    packages = forEachSupportedSystem ({ pkgs }:
    {
      batnotifsd               = pkgs.callPackage ./pkgs/batnotifsd.nix               { };
      libratbag-git            = pkgs.callPackage ./pkgs/libratbag-git.nix            { };
      openrgb-git              = pkgs.callPackage ./pkgs/openrgb-git.nix              { };
      piper-git                = pkgs.callPackage ./pkgs/piper-git.nix                { };
      plymouth-spinnerv2-theme = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix { };
      weather4bar              = pkgs.callPackage ./pkgs/weather4bar.nix              { };
    });
  };
}
