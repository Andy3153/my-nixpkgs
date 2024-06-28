{
  description = "Andy3153's collection of packages for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
  {
    packages.x86_64-linux =
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      plymouth-spinnerv2-theme = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix { };
      stylepak                 = pkgs.callPackage ./pkgs/stylepak.nix { };
    };
  };
}
