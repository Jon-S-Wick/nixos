{ pkgs }:
{
  name,
  src,
  meta,
  arcs,
}:
let

  arcStore = import ./arcStore.nix { inherit pkgs; };

  # Get theme configuration from themes.json
  themeConfig = {
    gtk = arcs.gtk or null;
    icon = arcs.icon or null;
    cursor = arcs.cursor or null;
    font = arcs.font or null;
  };

  # Fetch arc packages if defined in theme config
  themeArcs =
    if themeConfig != null then
      {
        gtk =
          if themeConfig.gtk != null then
            {
              name = themeConfig.gtk;
              pkg = arcStore.gtk.${themeConfig.gtk} or null;
            }
          else
            null;

        icon =
          if themeConfig.icon != null then
            {
              name = themeConfig.icon;
              pkg = arcStore.icon.${themeConfig.icon} or null;
            }
          else
            null;

        cursor =
          if themeConfig.cursor != null then
            {
              name = themeConfig.cursor;
              pkg = arcStore.cursor.${themeConfig.cursor} or null;
            }
          else
            null;

        font =
          if themeConfig.font != null then
            {
              name = themeConfig.font;
              pkg = arcStore.font.${themeConfig.font} or null;
            }
          else
            null;
      }
    else
      { };

  # TODO: perf: swwwallcache.sh and wallbash.sh should run at buildtime
  # mkTheme is a wrapper around the hyde theme package that:
  # - Creates a derivation for the theme package at build time
  # - Parses the hypr.theme file to extract theme values
  # - Sets up GTK, icon, cursor and font theme packages if extracted from hypr.theme
  # - Handles installation of theme files and wallpapers
  pkg = pkgs.stdenv.mkDerivation {
    inherit name src;

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
        mkdir -p $out/share/hyde/themes

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

        cp -r Configs/.config/hyde/themes/"${name}"/. $out/share/hyde/themes/"${name}"

        find ./Configs/ -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \) -exec cp --no-preserve=mode {} $out/share/hyde/themes/"${name}"/wallpapers/ \;
    '';

    meta = with pkgs.lib; {
      inherit (meta) description homepage;
      license = licenses.mit;
      platforms = platforms.all;
    };
  };

  # wallpapers are built into the theme package so they are available at build time
  walls = pkg.outPath + "/share/hyde/themes/${name}/wallpapers";

in
{
  inherit name pkg walls;
  src = pkg.src;
  arcs = themeArcs;
}
