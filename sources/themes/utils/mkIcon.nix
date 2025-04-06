{ pkgs }:

args:
let
  normalizedName = builtins.replaceStrings [ " " ] [ "-" ] args.iconName;
in
pkgs.stdenv.mkDerivation {
  name = "hyde-icon-${normalizedName}";
  version = "1.0.0";

  src = pkgs.fetchurl {
    url = args.url;
    hash = args.hash;
    name = "hyde-icon-${normalizedName}-source";
  };

  nativeBuildInputs = [
    pkgs.jdupes
    pkgs.gnutar
  ];

  dontDropIconThemeCache = true;

  dontPatchELF = true;
  dontRewriteSymlinks = true;

  unpackPhase = ''
    runHook preUnpack
    mkdir -p "$out/share/icons/${args.iconName}"
    tar xf "$src" --strip-components=1 --skip-old-files -C "$out/share/icons/${args.iconName}"
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    # Run jdupes with more aggressive optimization flags
    jdupes --recurse "$out/share"

    runHook postInstall
  '';
}
