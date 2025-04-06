{ pkgs }:

args:
let
  normalizedName = builtins.replaceStrings [ " " ] [ "-" ] args.cursorName;
in
pkgs.stdenv.mkDerivation {
  name = "hyde-cursor-${normalizedName}";
  version = "1.0.0";

  src = pkgs.fetchzip {
    url = args.url;
    hash = args.hash;
    name = "hyde-cursor-${normalizedName}-source";
  };

  nativeBuildInputs = [
    pkgs.jdupes
  ];

  dontConfigure = true;
  dontBuild = true;
  dontDropIconThemeCache = true;
  dontPatchELF = true;
  dontRewriteSymlinks = true;

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/icons/${args.cursorName}"

    # Copy cursor contents directly to icons directory
    cp -a * "$out/share/icons/${args.cursorName}"

    jdupes -r "$out/share/icons/${args.cursorName}"

    runHook postInstall
  '';
}
