{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Gruvbox Retro";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "11e0face8c74526fca5519f47cbe90458eef6cd1";
    name = name;
    sha256 = "sha256-/6CZmFjmUOIw5qCQSURcjsHL6vsA1b5yIfzKi3fd88k=";
  };

  arcs = {
    gtk = "Gruvbox-Retro";
    icon = "Gruvbox-Plus-Dark";
    cursor = "Gruvbox-Retro";
  };

  meta = {
    description = "HyDE Theme: Gruvbox Retro";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Gruvbox-Retro";
  };
}
