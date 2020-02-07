# init-haskell

A script thing I use to set up a folder for developing a new Haskell project with Nix, niv, hpack, ghcide, and Cabal 3.0.

## Usage

### Set up

```
cd ./myprojectname
init-haskell
# wait 20 years for everything to get set up
```

### Build

```
hpack && cabal run
```

### IDE

```
ghcide
```

## Dependencies

Requires Nix to be installed, gets everything else it needs through a Nix shell.

Please read through the script and substitute the appropriate parts before you execute it. PRs to parametrize out my name and preferred list of extensions welcome.
