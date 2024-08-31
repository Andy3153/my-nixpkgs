{
  description = "Andy3153's collection of packages for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { nixpkgs, ... }:
  {
    packages.x86_64-linux =
    let
      # {{{ Variables
      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      # For packages that use scrips I have in my `Hyprland Rice` repo
      hyprlandRiceRev  = "1142493bf6cd0702d33294f7dc3a67d27ad5320c";
      hyprlandRiceHash = "sha256-qKhnDV5sc7OhTUuyKBOxcGOSE3Xs8LOo9aWZJfRjfh0=";
      # }}}
    in
    {
      plymouth-spinnerv2-theme = pkgs.callPackage ./pkgs/plymouth-spinnerv2-theme.nix { };
      waybar-weather           = pkgs.callPackage ./pkgs/waybar-weather.nix { rev = hyprlandRiceRev; hash = hyprlandRiceHash; };
    };
  };
}
