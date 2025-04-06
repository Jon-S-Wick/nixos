{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Catppuccin Mocha";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "d2052a18ed6e1f9e6d70c3431d27bf94f42be628";
    name = name;
    sha256 = "sha256-YbT1Rm49igI3H1wH21V5f+npjgbj0ya0Dfh9tM62nVI=";
  };

  arcs = {
    gtk = "Catppuccin-Mocha";
    icon = "Tela-circle-dracula";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Mocha";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Mocha";
  };
}
