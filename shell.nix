{ pkgs ,... }:

pkgs.mkShell {
  buildInputs = [ pkgs.perl pkgs.libxcrypt ];

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.libxcrypt}/lib:$LD_LIBRARY_PATH
  '';
}

