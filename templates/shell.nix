let
  sources = import ./nix/sources.nix;
  compilerVersion = import ./compiler.nix;
  hnix = import sources.iohk-hnix {};
  pkgs = (import hnix.sources.nixpkgs) hnix.nixpkgsArgs;
  hls = import sources.all-hls { inherit pkgs; version = "1.0.0"; ghc = "8.10.4"; }; # TODO: generate this string from the ghc template variable
  snapshot = import ./snapshot.nix;
in
(import ./.).shellFor {
  withHoogle = true;
  buildInputs = [
    hls
    (pkgs.haskell-nix.tool compilerVersion "hpack"         { index-state = snapshot; version = "0.34.4"; })
    (pkgs.haskell-nix.tool compilerVersion "cabal-install" { index-state = snapshot; version = "3.4.0.0"; })
    (pkgs.haskell-nix.tool compilerVersion "ghcid"         { index-state = snapshot; version = "0.8.7";  })
  ];
}
