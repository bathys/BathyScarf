{ pkgs, config, ... }:
{
  imports = [
    ./layout.nix
    ./style.css
    ./bundle.nix
  ];
}
