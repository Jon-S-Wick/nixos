{ pkgs }:

args:
let
  normalizedName = builtins.replaceStrings [ " " ] [ "-" ] args.gtkName;
in
pkgs.stdenv.mkDerivation {
  name = "hyde-gtk-${normalizedName}";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.url;
    hash = args.hash;
    name = "hyde-gtk-${normalizedName}-source";
  };

  dontConfigure = true;
  dontBuild = true;
  dontDropIconThemeCache = true;
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/themes/${args.gtkName}"

    # Copy theme contents directly to themes directory
    cp -r . "$out/share/themes/${args.gtkName}/"

    runHook postInstall
  '';
}
