{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Frosted Glass";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "c6f5c5ca25c66741772b5c25582ab1ad8972ba49";
    name = name;
    sha256 = "sha256-AsSXRvVvIyhpPB789oSezEpmXCuCrQIDjYTf+PljHmM=";
  };

  arcs = {
    gtk = "Frosted-Glass";
    icon = "Tela-circle-blue";
  };

  meta = {
    description = "HyDE Theme: Frosted Glass";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Frosted-Glass";
  };
}
