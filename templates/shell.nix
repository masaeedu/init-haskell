with import ./.;
project.shellFor {
  withHoogle = false;
  buildInputs = [
    cabal-install
    hpack
    ghcid
    hls
  ];
}
