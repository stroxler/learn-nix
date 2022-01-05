# This is the only line changed relative to before. The
# relative path evaluates to the expression defined by that
# source file.
#
# Note that now it's a little clearer what the extra {} is
# for - we're passing an empty Attribute Set as the environment
# in which to evaluate that expression.
{ pkgs ? import ./pinnedNixpkgs.nix  {} }:

pkgs.stdenv.mkDerivation {
  name = "my-first-derivation";
  src = ./src;
  installPhase = ''
    mkdir $out
    cp -rv $src/* $out
  '';
}
