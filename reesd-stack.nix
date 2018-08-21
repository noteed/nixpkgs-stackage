let
  pkgs = import <nixpkgs> {
    # Provide lts-921-reesd.
    overlays = [ (import ./default.nix) ] ;
  };
  hspkgs = pkgs.haskell.packages.stackage.lts-921-reesd;
in
{
  reesd-stack-lts-921 = hspkgs.ghcWithPackages (p: with p; [
    snap
  ]);
}
