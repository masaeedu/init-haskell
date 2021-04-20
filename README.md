# init-haskell

Scaffolding for developing a Haskell project with Nix, niv, hpack, haskell-language-server, and Cabal 3.

## Usage

### Set up

Download this repo and add it to your PATH. To start a new project:

```
mkdir myprojectname && cd myprojectname
init-haskell
```

### Build and run

```
hpack && cabal run
```

### IDE

Your editor can use `haskell-language-server` to get language server analysis.

Note: the Cabal file must exist for this to work (so you need to generate it by running `hpack`).

You can invoke the following in a terminal to get live error info:

```
ghcid
```

## Demo

[Asciinema recording](https://asciinema.org/a/ClTzNb2F2aGZ2bKCg7vTp86xc)

## Dependencies

Requires Nix to be installed, gets everything else it needs through a Nix shell. You'll also want `direnv` installed globally if you want to automatically be dropped into a shell with all the goodies, otherwise manually use `nix-shell`.
