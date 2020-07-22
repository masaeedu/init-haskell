let
  sources = import ./nix/sources.nix;
  compilerVersion = "{{ghc}}";
  ghcide = (import sources.ghcide-nix {})."ghcide-${compilerVersion}";
  hspkgs = import ./.;
in
hspkgs.shellFor {
  withHoogle = true;
  buildInputs = [ ghcide ];
}
