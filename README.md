<!-- vim: set fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}: -->

# my-nixpkgs
This is my collection of packages for Nix.

Packages here either aren't in NixPkgs (because they're way too personal to be useful to anyone else), or are and my derivations are just overrides to get the latest version and they compile the latest commit from Git.

## Usage
Add this repo as a flake input to your main flake. For example:
<!-- {{{ Sample flake -->
```nix
# flake.nix

{
  inputs =
  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # my-nixpkgs
    my-nixpkgs =
    {
      url = "github:Andy3153/my-nixpkgs";
      inputs.nixpkgs.follows = "nixpkgs"; # to avoid multiple nixpkgs instances on your computer
    };
  };

  outputs = inputs@
  {
    self,
    nixpkgs,
    my-nixpkgs,
    ...
  }: rec
  {
    nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem
    {
      modules =
      [
        ({ ... }: { _module.args = { my-pkgs = my-nixpkgs.packages.x86_64-linux; }; })

        ./path/to/your/configuration.nix
      ];
    };
  };
}
```
<!-- }}} -->

After adding the input, the packages can be used in your configuration like this:
<!-- {{{ Sample configuration -->
```nix
# configuration.nix

{ lib, pkgs, my-pkgs, ... }:

{
  environment.systemPackages = lib.mkMerge
  [
    (with pkgs;    # your normal packages from nixpkgs
    [
      git
      htop
    ])

    (with my-pkgs; # packages from this flake
    [
      openrgb-git
      plymouth-spinnerv2-theme
    ])
  ];
}
```
<!-- }}} -->

## Packages
<!-- {{{ Package table -->
| Package                  | Description                                                                                                                                                                                                    |
| :-----:                  | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| batnotifsd               | A Python script that sends notifications about the battery's status.                                                                                                                                           |
| libratbag-git            | Configuration library for gaming mice (latest Git commit)                                                                                                                                                      |
| openrgb-git              | Open source RGB lighting control (latest Git commit)                                                                                                                                                           |
| piper-git                | GTK frontend for ratbagd mouse config daemon (latest Git commit)                                                                                                                                               |
| plymouth-spinnerv2-theme | Plymouth theme with the ACPI BGRT graphics on the background, custom elements, spinner animation from [adi1090x/plymouth-themes](https://github.com/adi1090x/plymouth-themes) and the NixOS logo at the bottom |
| waybar-weather           | My weather script for Waybar                                                                                                                                                                                   |
<!-- }}} -->
