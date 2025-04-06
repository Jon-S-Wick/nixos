{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Synth Wave";
  src = pkgs.fetchFromGitHub {
    owner = "prasanthrangan";
    repo = "hyde-themes";
    rev = "61c389a0ba3c0858e000436a359385389cda7f44";
    name = name;
    sha256 = "sha256-2qkR61CaUyHry/clQb7WVMSt4rV+4c4yElRxqSwF73Y=";
  };

  arcs = {
    gtk = "Synth-Wave";
    icon = "BeautyLine";
  };

  meta = {
    description = "HyDE Theme: Synth Wave";
    homepage = "https://github.com/prasanthrangan/hyde-themes/tree/Synth-Wave";
  };
}
