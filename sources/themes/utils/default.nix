{ pkgs }:

{
  mkCursor = import ./mkCursor.nix { inherit pkgs; };
  mkIcon = import ./mkIcon.nix { inherit pkgs; };
  mkGtk = import ./mkGtk.nix { inherit pkgs; };
  mkFont = import ./mkFont.nix { inherit pkgs; };
  mkWalls = import ./mkWalls.nix { inherit pkgs; };
  parseTheme = import ./parseTheme.nix { inherit pkgs; };
  mkTheme = import ./mkTheme.nix { inherit pkgs; };
}
