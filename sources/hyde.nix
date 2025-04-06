{ pkgs, ... }:

let
  # https://github.com/prasanthrangan/hyprdots/commit/2a0abfd56ce951e75213a1a91e2743a859304713
  hyprdotsRepo = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyprdots";
    rev = "2a0abfd56ce951e75213a1a91e2743a859304713";
    sha256 = "sha256-lSMO2V4eydXQPXJ4NbcciymC2sto3t/Wn/FLBd9mXo0=";
  };

  polkitkdeauth = ''
    #! /usr/bin/env bash
    ~/.local/state/nix/profiles/home-manager/home-path/libexec/polkit-gnome-authentication-agent-1 &
  '';

  pkg = pkgs.stdenv.mkDerivation rec {
    name = "hyprdots-modified";
    src = hyprdotsRepo;

    buildPhase = ''
       # ensure all shell scripts use env bash shebang, preserving other interpreters
       find . -type f -executable -print0 | xargs -0 -I {} sh -c '
         if head -n1 "{}" | grep -q "^#!.*sh" ; then
           sed -i "1s|^#!.*|#!/usr/bin/env bash|" "{}"
         fi'

       # Update waybar killall command in all hyprdots files
       find . -type f -print0 | xargs -0 sed -i 's/killall waybar/killall .waybar-wrapped/g'

       # update dunst
       find . -type f -print0 | xargs -0 sed -i 's/killall dunst/killall .dunst-wrapped/g'

       # update kitty
       find . -type f -print0 | xargs -0 sed -i 's/killall kitty/killall .kitty-wrapped/g'

       find . -type f -executable -print0 | xargs -0 sed -i 's/find "/find -L "/g'
       find . -type f -name "*.sh" -print0 | xargs -0 sed -i 's/find "/find -L "/g'

      # scripts need to use dconf instead of gsettings
       find . -type f -not -name 'themepatcher.sh' -exec sed -i \
         -e 's/gsettings set/dconf write/g' \
         -e 's/gsettings get/dconf read/g' \
         -e 's/org\.gnome\.desktop\.interface \([^ ]*\)/\/org\/gnome\/desktop\/interface\/\1/g' \
         -e 's/org\.gnome\.desktop\.gtk \([^ ]*\)/\/org\/gnome\/desktop\/gtk\/\1/g' \
         -e 's/\(dconf write.*font-name\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*cursor-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*color-scheme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*gtk-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*icon-theme\) '"'"'\([^'"'"']*\)'"'"'/\1 "'"'"'\2'"'"'"/' \
         -e 's/\(dconf write.*[^ ]*\) '"'"'\(\$[A-Za-z_][A-Za-z0-9_]*\)'"'"'/\1 "\2"/g' \
         -e 's/\(dconf write.*[^ ]*\) \(\$[A-Za-z_][A-Za-z0-9_]*\)/\1 "\2"/g' \
         {} +

        # add home-manager case to scripts
        find . -type f \( -name "*.sh" -o -executable \) -exec sed -i '/^if \[ -d \/run\/current-system\/sw\/share\/themes/,/else/c\if [ -d /run/current-system/sw/share/themes ] ; then\n    themeDir=/run/current-system/sw/share/themes\nelif [ -d ~/.local/state/nix/profiles/home-manager/home-path/share/themes ] ; then\n    themeDir=~/.local/state/nix/profiles/home-manager/home-path/share/themes\nelse' {} \;

        # replace polkitkdeauth
        cat ${polkitkdeauth} > ./Configs/.local/share/bin/polkitkdeauth.sh

        # add nix check to globalcontrol.sh pkg_installed
         sed -i '/command -v "''${pkgIn}" /i\    elif command -v nix \&> /dev/null \&\& nix-locate --whole-name --top-level "bin/''${pkgIn}" \&> /dev/null ; then\n        return 0' ./Configs/.local/share/bin/globalcontrol.sh
         
    '';

    passthru = {
      inherit src;
    };

    installPhase = ''
      mkdir -p $out/share/hyde/hyprdots-modified
      cp -r . $out/share/hyde/hyprdots-modified
    '';
  };
in
pkg
