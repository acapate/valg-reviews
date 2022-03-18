{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.pandoc

    # keep this line if you use bash
    pkgs.bashInteractive
  ];
}
