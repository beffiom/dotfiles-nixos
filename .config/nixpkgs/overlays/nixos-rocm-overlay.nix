final: prev: {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nixos-rocm/archive/refs/tags/2.2.0.tar.gz";
    }))
  ];
}
