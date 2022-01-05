# This source defines a nix Function which accepts as input
# a nix Attribute Set, provides a default value for pkgs,
# and returns a derivation value.
#
# In general, every nix source file is an expression.
#
# This first part of the expression is essentially a let
# binding that defines pkgs to be <nixpkgs> if it isn't
# already set in the incoming Attribute Set.
{ pkgs ? import <nixpkgs>  {} }:

# here we're basically passing a dictionary of data to
# the mkDerivation function. I'm not yet certain precisely
# what the curly brackets mean, but it's some kind of struct
# or dict like thing.
pkgs.stdenv.mkDerivation {

  # all derivations must have names.
  name = "my-first-derivation";

  # to use mkDerivation we always have to define a src;
  # a derivation written from scratch wouldn't necessarily
  # have to define src.
  src = ./src;

  # The input to mkDerivation can define several phases,
  # see https://nixos.org/nixpkgs/manual/#sec-stdenv-phases.
  #
  # We only need to define the phases we want, here we only
  # need the install phase.
  #
  # $src and $out are env vars that will be defined
  # by nix when the script runs.
  installPhase = ''
    mkdir $out
    cp -rv $src/* $out
  '';
}
