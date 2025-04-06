{pkgs, lib,...}:
let
  python = pkgs.python39;
  # We currently take all libraries from systemd and nix as the default
  # https://github.com/NixOS/nixpkgs/blob/c339c066b893e5683830ba870b1ccd3bbea88ece/nixos/modules/programs/nix-ld.nix#L44
  pythonldlibpath = lib.makeLibraryPath (with pkgs; [
    zlib
    zstd
    stdenv.cc.cc
    curl
    openssl
    attr
    libssh
    bzip2
    libxml2
    acl
    libsodium
    util-linux
    xz
    systemd
  ]);
  patchedpython = (python.overrideAttrs (
    previousAttrs: {
      # Add the nix-ld libraries to the LD_LIBRARY_PATH.
      # creating a new library path from all desired libraries
      postInstall = previousAttrs.postInstall + ''
        mv  "$out/bin/python3.11" "$out/bin/unpatched_python3.11"
        cat << EOF >> "$out/bin/python3.11"
        #!/run/current-system/sw/bin/bash
        export LD_LIBRARY_PATH="${pythonldlibpath}"
        exec "$out/bin/unpatched_python3.11" "\$@"
        EOF
        chmod +x "$out/bin/python3.11"
      '';
    }
  ));
  # if you want poetry
  patchedpoetry =  ((pkgs.poetry.override { python3 = patchedpython; }).overrideAttrs (
    previousAttrs: {
      # same as above, but for poetry
      # not that if you dont keep the blank line bellow, it crashes :(
      postInstall = previousAttrs.postInstall + ''

        mv "$out/bin/poetry" "$out/bin/unpatched_poetry"
        cat << EOF >> "$out/bin/poetry"
        #!/run/current-system/sw/bin/bash
        export LD_LIBRARY_PATH="${pythonldlibpath}"
        exec "$out/bin/unpatched_poetry" "\$@"
        EOF
        chmod +x "$out/bin/poetry"
      '';
    }
  ));
in
{
  # Some other config...
  
  environment.systemPackages = with pkgs; [
    patchedpython

    # if you want poetry
    patchedpoetry
  ];
}
