{ pkgs }:

args:
let
  normalizedName = builtins.replaceStrings [ " " ] [ "-" ] args.fontName;
in
pkgs.stdenv.mkDerivation {
  name = "hyde-font-${normalizedName}";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.url;
    hash = args.hash;
    name = "hyde-font-${normalizedName}-source";
  };

  dontConfigure = true;
  dontBuild = true;
  dontDropIconThemeCache = true;
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/fonts/${args.fontName}"

    # Copy all font files directly to fonts directory
    cp -a * "$out/share/fonts/${args.fontName}"

    runHook postInstall
  '';
}
