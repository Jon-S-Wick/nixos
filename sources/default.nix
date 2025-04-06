{
  lib,
  pkgs,
  ...
}:
# TODO: use overlays as imports for convenience
# TODO: include themeStore in overlays
let
  sources = {
    hyde-cli = import ./hyde-cli.nix { inherit pkgs lib; };
    hyde = import ./hyde.nix { inherit pkgs; };
    wallbash-gtk = import ./wallbash-gtk.nix { inherit pkgs lib; };
    spicetify-sleek = import ./spicetify-sleek.nix { inherit pkgs lib; };
    hyde-fonts = import ./hyde-fonts.nix { inherit pkgs; };
    pokemon-colorscripts = import ./pokemon-colorscripts.nix { inherit pkgs lib; };
    vscode-wallbash = import ./vscode-wallbash.nix { inherit pkgs; };
    hyde-gallery = import ./hyde-gallery.nix { inherit pkgs lib; };
    sddm-candy = import ./sddm-candy.nix { inherit pkgs; };
    sddm-corners = import ./sddm-corners.nix { inherit pkgs; };
  };

  overlays = builtins.mapAttrs (name: value: self: super: {
    ${name} = value;
  }) sources;

in
{

  nixpkgs.overlays = builtins.attrValues overlays;

  home.packages = builtins.attrValues sources;
}
