host='root@51.250.47.185'
nixos-rebuild switch --flake .#nixos --build-host "$host" --target-host "$host" --fast
