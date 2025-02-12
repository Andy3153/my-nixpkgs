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
      batnotifsd                      = pkgs.callPackage ./pkgs/batnotifsd.nix                      { };
      libratbag-git                   = pkgs.callPackage ./pkgs/libratbag-git.nix                   { };
      openrgb-git                     = pkgs.callPackage ./pkgs/openrgb-git.nix                     { };
      openrgb-plugin-effects-git      = pkgs.callPackage ./pkgs/openrgb-plugin-effects-git.nix      { my-pkgs = my-pkgs; };
      openrgb-plugin-hardwaresync-git = pkgs.callPackage ./pkgs/openrgb-plugin-hardwaresync-git.nix { my-pkgs = my-pkgs; };
      piper-git                       = pkgs.callPackage ./pkgs/piper-git.nix                       { };
      plymouth-spinnerv2-theme        = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix        { };
      syrics                          = pkgs.callPackage ./pkgs/syrics.nix                          { };
      weather4bar                     = pkgs.callPackage ./pkgs/weather4bar.nix                     { };
    });
  };
}
