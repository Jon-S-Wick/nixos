{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Catppuccin Latte";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "2b526598b76ae613d1de42fd3b089ba919ea6aec";
    name = name;
    sha256 = "sha256-WX+knhJnlnSMsNrof+b1d5+kGIGsmRWi962HhkBRJyc=";
  };

  arcs = {
    gtk = "Catppuccin-Latte";
    icon = "Tela-circle-grey";
  };

  meta = {
    description = "HyDE Theme: Catppuccin Latte";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Catppuccin-Latte";
  };
}
