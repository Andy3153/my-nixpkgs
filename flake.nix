{
  description = "Andy3153's collection of packages for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
  {
    self,
    nixpkgs,
    ...
  }:
  let
    # {{{ Variables
    supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
    forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f
    {
      pkgs    = import nixpkgs { inherit system; };
      my-pkgs = self.outputs.packages.${system};
    });
    # }}}
  in
  {
    packages = forEachSupportedSystem ({ pkgs, my-pkgs }:
    {
      batnotifsd                  = pkgs.callPackage ./pkgs/batnotifsd.nix                  { };
      libratbag-git               = pkgs.callPackage ./pkgs/libratbag-git.nix               { };
      openrgb                     = pkgs.callPackage ./pkgs/openrgb.nix                     { my-pkgs = my-pkgs; };
      openrgb-plugin-effects      = pkgs.callPackage ./pkgs/openrgb-plugin-effects.nix      { my-pkgs = my-pkgs; };
      openrgb-plugin-hardwaresync = pkgs.callPackage ./pkgs/openrgb-plugin-hardwaresync.nix { my-pkgs = my-pkgs; };
      openrgb-with-all-plugins    = pkgs.callPackage ./pkgs/openrgb-with-all-plugins.nix    { my-pkgs = my-pkgs; };
      piper-git                   = pkgs.callPackage ./pkgs/piper-git.nix                   { };
      plymouth-spinnerv2-theme    = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix    { };
      syrics                      = pkgs.callPackage ./pkgs/syrics.nix                      { };
      weather4bar                 = pkgs.callPackage ./pkgs/weather4bar.nix                 { };
    });
  };
}
