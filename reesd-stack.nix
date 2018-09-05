let
  nixpkgs = builtins.fetchTarball {
    sha256 = "1fxmy6fmsx6fp3h2k9jyg4q41dfl1777wswk9bx3v9hzm114pjy7";
    url = https://github.com/nixos/nixpkgs/archive/e9d4bab04458cd03cb9029d2d571c37cc017ffdc.tar.gz;
  };
  pkgs = import nixpkgs {
    # Provide lts-921-reesd.
    overlays = [ (import ./default.nix) ] ;
  };
  hspkgs = pkgs.haskell.packages.stackage.lts-921-reesd;
in
{
  reesd-stack-lts-921-ghc = hspkgs.ghc;
  reesd-stack-lts-921 = hspkgs.ghcWithPackages (p: with p; [
    acid-state
    blaze-builder
    blaze-html
    postgresql-simple
    QuickCheck
    safecopy
    snap
    snap-blaze
    snap-core
    sqlite-simple
    tasty
    tasty-hunit
  ]);
}
