{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Edge Runner";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "a007d1b32cb98fa5eef4b0450fc5ba9bfc5c2545";
    name = name;
    sha256 = "sha256-c5BKdcZw5Yd+bxwpc+PDtKrtZwNGkRlU1R/Y0APq/iA=";
  };

  arcs = {
    gtk = "Edge-Runner";
    icon = "Tela-circle-yellow";
  };

  meta = {
    description = "HyDE Theme: Edge Runner";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Edge-Runner";
  };
}
