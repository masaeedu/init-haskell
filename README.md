# init-haskell

A script thing I use to set up a folder for developing a new Haskell project with Nix, niv, hpack, ghcide, and Cabal 3.0.

## Usage

### Set up

```
cd ./myprojectname
init-haskell
# wait 20 years for everything to get set up
```

### Build and run

```
hpack && cabal run
```

### IDE

Your editor can invoke the following to get language server analysis:

```
ghcide
```

You can invoke the following in a terminal to get live error info:

```
ghcid
```

## Demo

[Asciinema recording](https://asciinema.org/a/mqEqyvyXfGKKjjj5wECdNoShN)

## Dependencies

Requires Nix to be installed, gets everything else it needs through a Nix shell. You'll also want `direnv` installed globally if you want to automatically be dropped into a shell with all the goodies, otherwise manually use `nix-shell`.

Please read through the script and substitute the appropriate parts before you execute it. PRs to parametrize out my name and preferred list of extensions welcome.
