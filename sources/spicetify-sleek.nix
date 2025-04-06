{ pkgs, ... }:

let
  pkg = pkgs.stdenv.mkDerivation rec {
    name = "Spicetify-Sleek";
    src = pkgs.fetchzip {
      url = "https://github.com/prasanthrangan/hyprdots/raw/refs/heads/main/Source/arcs/Spotify_Sleek.tar.gz";
      sha256 = "sha256-kGdCHGht3ij3n118+x76SR3cAeIpjPHjq0Ow0YRW21I=";
    };

    installPhase = ''
      mkdir -p $out/share/spicetify/themes/${name}
      cp -r . $out/share/spicetify/themes/${name}
    '';
  };
in
pkg
