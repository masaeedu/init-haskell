This project uses various nix expressions for building code. In order to avoid building a huge amount of stuff at once, you might want to enable the following [cachix](https://cachix.org/) caches:

- [iohk](https://iohk.cachix.org)
- [init-haskell](https://init-haskell.cachix.org)

You can enable a cachix cache by installing cachix (`nix-env -iA nixpkgs.cachix`), and then running `cachix use <cache name>`
