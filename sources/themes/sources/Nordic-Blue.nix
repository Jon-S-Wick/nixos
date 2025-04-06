{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Nordic Blue";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "bbe3b5c7b10743bb2c274d51f5efce6e5f51d7e4";
    name = name;
    sha256 = "sha256-YyuwnWvd8hMOetFsGpEvk5uiny55mMpSKqhhWzUTwL8=";
  };

  arcs = {
    gtk = "Nordic-Blue";
    icon = "Nordzy";
  };

  meta = {
    description = "HyDE Theme: Nordic Blue";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Nordic-Blue";
  };
}
