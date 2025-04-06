{ config, lib, ... }: {

  options = {
    var = lib.mkOption {
      type = lib.types.attrs;
      default = { };
    };
  };

  config.var = {

    hostname = "jonwick";
    username = "jonwick";
    configDirectory = "/home/" + "jonwick"
      + "/.config/nixos"; # The path of the nixos configuration directory

    keyboardLayout = "us";

    location = "Los_Angeles";
    timeZone = "America/Los_Angeles";
    defaultLocale = "en_US.UTF-8";

    git = {
      username = "jonwick";
      email = "jonw3821@outlook.com";
      core.autocrlf = "input";
    };

    autoUpgrade = false;
    autoGarbageCollector = false;

    # Choose your theme variables here
    theme = import ./themes/var/pinky.nix;
  };
}
