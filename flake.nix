{
  description = "My curriculum vitae using LaTeX";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    flake-utils,
    nixpkgs,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };

        tex = pkgs.texlive.combine {
          inherit
            (pkgs.texlive)
            fontawesome
            helvetic
            ifmtarg
            transparent
            moresize
            paracol
            scheme-small
            xifthen
            xstring
            ;
        };
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              tex
            ];
          };
      }
    );
}
