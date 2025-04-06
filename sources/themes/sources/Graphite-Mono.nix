{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Graphite Mono";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "20710b605787b54489bbb9881e2a011258c2956a";
    name = name;
    sha256 = "sha256-gY7HWmxw7LApPQPYQ0LoKpYKvEVbAS2Gz2rogAi4PFY=";
  };

  arcs = {
    gtk = "Graphite-Mono";
    icon = "Tela-circle-grey";
  };

  meta = {
    description = "HyDE Theme: Graphite Mono";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Graphite-Mono";
  };
}
