{
  pkgs,
  cfg,
  ...
}:
let

  # Helper function to create theme entries
  mkTheme = name: {
    inherit name;
    module = ./sources + "/${builtins.replaceStrings [ " " ] [ "-" ] name}.nix";
  };

  # List of theme names
  themeNames = [
    # -- Default themes
    "Catppuccin Mocha"
    "Catppuccin Latte"
    "Decay Green"
    "Edge Runner"
    "Frosted Glass"
    "Graphite Mono"
    "Gruvbox Retro"
    "Material Sakura"
    "Nordic Blue"
    "Rose Pine"
    "Synth Wave"
    "Tokyo Night"

    # -- Themes from hyde-gallery
    "Abyssal-Wave"
    "AbyssGreen"
    "Bad Blood"
    "Cat Latte"
    "Dracula"
    "Edge Runner"
    "Green Lush"
    "Greenify"
    "Hack the Box"
    "Ice Age"
    "Mac OS"
    "Monokai"
    "One Dark"
    "Oxo Carbon"
    "Paranoid Sweet"
    "Rain Dark"
    "Red Stone"
    "Rose Pine"
    "Scarlet Night"
    "Sci-fi"
    "Solarized Dark"
    "Windows 11"
    "Monterey Frost"
    "Vanta Black"
    "Pixel Dream"
    "Crimson Blade"
  ];

  # Generate theme list using map
  themes = map mkTheme themeNames;

  themeDerivations = builtins.listToAttrs (
    map (theme: {
      name = theme.name;
      value = pkgs.callPackage theme.module { inherit pkgs; };
    }) themes
  );

  # Filter themes based on name property
  filteredThemes = builtins.filter (theme: builtins.elem theme.name cfg.themes) (
    builtins.attrValues themeDerivations
  );
in
{
  inherit themeDerivations filteredThemes;
}
