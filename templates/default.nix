let
  sources = import ./nix/sources.nix;
  compilerVersion = with import ./compiler.nix; "ghc${major}${minor}${patch}";
  hnix = import sources.iohk-hnix {};
  pkgs = (import hnix.sources.nixpkgs-unstable) hnix.nixpkgsArgs;
  snapshot = import ./snapshot.nix;
in
rec {
  inherit hnix pkgs;

  cabal-install =
    pkgs.haskell-nix.tool compilerVersion "cabal-install" { index-state = snapshot; };

  hpack =
    pkgs.haskell-nix.tool compilerVersion "hpack" { index-state = snapshot; };

  ghcid =
    pkgs.haskell-nix.tool compilerVersion "ghcid" { index-state = snapshot; };

  hls =
    pkgs.haskell-nix.tool compilerVersion "haskell-language-server" { index-state = snapshot; };

  project =
    pkgs.haskell-nix.cabalProject {
      src = pkgs.haskell-nix.haskellLib.cleanGit { src = ./.; name = "{{projectname}}"; };
      compiler-nix-name = compilerVersion;
      inherit cabal-install;
    };
}

