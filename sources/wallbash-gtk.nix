{ pkgs, ... }:

let

  pkg = pkgs.stdenv.mkDerivation rec {
    name = "Wallbash-Gtk";
    src = pkgs.fetchzip {
      url = "https://github.com/prasanthrangan/hyprdots/raw/refs/heads/main/Source/arcs/Gtk_Wallbash.tar.gz";
      sha256 = "sha256-I5eR639+WO+qEUkCtDbzcJaVABDp6VOK0+ZO4VRAuWs=";
    };
    installPhase = ''
      mkdir -p $out/share/themes/${name}
      cp -r . $out/share/themes/${name}
    '';
  };
in
pkg
