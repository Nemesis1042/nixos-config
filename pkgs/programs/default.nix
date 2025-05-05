# pkgs/programs/default.nix
{ pkgs, ... }:
{
  mandown = pkgs.callPackage ./mandown.nix {};
}

