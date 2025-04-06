{ config, pkgs, ... }: {
  # Enable nix ld
  programs.nix-ld.enable = true;

  # Sets up all the libraries to load
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    gcc
    openssl
    libxcrypt
    libxml2
    glib
    glibc

    # ...
  ];
}
