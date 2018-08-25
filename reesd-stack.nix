let
  nixpkgs = builtins.fetchTarball {
    sha256 = "0jxn25l8d65h6qnmx9f4dsi2fscqyxc0gvhnkj1bc7kicn9rr5hj";
    url = https://github.com/nixos/nixpkgs/archive/95a8cb3ade1.tar.gz;
  };
  pkgs = import nixpkgs {
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
