{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Material Sakura";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "76077f39ed496a4b84d38473b0419343734c323e";
    name = name;
    sha256 = "sha256-3tM422nWdWPEm7KY7Wh7fQ2KbzzZhBM6Zj8/z1aTVVo=";
  };

  arcs = {
    gtk = "Material-Sakura";
    icon = "Tela-circle-black";
  };

  meta = {
    description = "HyDE Theme: Material Sakura";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Material-Sakura";
  };
}
