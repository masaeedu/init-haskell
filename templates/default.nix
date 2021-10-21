let
  sources = import ./nix/sources.nix;
  compilerVersion = import ./compiler.nix;
  hnix = import sources.iohk-hnix {};
  pkgs = (import hnix.sources.nixpkgs-unstable) hnix.nixpkgsArgs;
  snapshot = import ./snapshot.nix;
in
rec {
  inherit hnix pkgs;

  cabal-install =
    pkgs.haskell-nix.tool compilerVersion "cabal-install" { index-state = snapshot; version = "3.4.0.0"; };

  project =
    pkgs.haskell-nix.cabalProject {
      src = pkgs.haskell-nix.haskellLib.cleanGit { src = ./.; name = "{{projectname}}"; };
      compiler-nix-name = compilerVersion;
      inherit cabal-install;
    };
}

