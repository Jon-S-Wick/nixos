%%bah

# nixos-rebuild switch -I nixos-config=/home/jonwick/nixos/configuration.nix --upgrade --show-trace
nixos-rebuild switch --flake .#jonwick --upgrade --show-trace
