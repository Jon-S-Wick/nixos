{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Decay Green";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "1287bb71b1519c8fdab2bba642a7b24ec8364b6c";
    name = name;
    sha256 = "sha256-/jApdX6ADJOHU9iSCTpGMmL3phNSDHxsrKXX5sBLRGQ=";
  };

  arcs = {
    gtk = "Decay-Green";
    icon = "Tela-circle-green";
  };

  meta = {
    description = "HyDE Theme: Decay Green";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Decay-Green";
  };
}
