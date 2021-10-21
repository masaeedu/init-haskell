let
  sources = import ./nix/sources.nix;
  compilerVersion = import ./compiler.nix;
  nix-haskell-hls = import sources.nix-haskell-hls;
  snapshot = import ./snapshot.nix;
in
with import ./.;
let hls = nix-haskell-hls { ghcVersion = (project.ghcWithPackages (_: [])).version; hlsUnstable = true; };
in
project.shellFor {
  withHoogle = false;
  buildInputs = [
    hls.hls-renamed
    hls.hls-wrapper
    cabal-install
    (pkgs.haskell-nix.tool compilerVersion "hpack"         { index-state = snapshot; version = "0.34.4"; })
    (pkgs.haskell-nix.tool compilerVersion "ghcid"         { index-state = snapshot; version = "0.8.7";  })
  ];
}
