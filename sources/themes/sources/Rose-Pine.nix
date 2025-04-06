{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Rosé Pine";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "b009a30d15c994fcbfa30f8a3fc5d1b0670d9653";
    name = name;
    sha256 = "sha256-hvTqM45cw580OXK95a09PxSCidFt7T4bVNjizhsb7IQ=";
  };

  arcs = {
    gtk = "Rose-Pine";
    icon = "Tela-circle-pink";
  };

  meta = {
    description = "HyDE Theme: Rosé Pine";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Rose-Pine";
  };
}
