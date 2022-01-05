import (
  builtins.fetchTarball {
    # The sha of a nixpkgs commit goes here. It's also possible to use one of the github tags.
    #
    # This commit is from 2022-01-05 at around 6:20 am PST.
    url = "https://github.com/NixOS/nixpkgs/archive/555d3d545ac0318a8d8898fd9a1b4088951a32f6.tar.gz";
    # The sha256 can be obtained via `nix-prefetch-url --unpack <url>`
    sha256 = "1dyv899pm1zmgi20wljb46i6pvh6jr885lrx76shp258i8rx01rz";
  }
)
