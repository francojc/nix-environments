{
  description = "An R programming environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github.com/numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };

      # Define general development packages
      packages = with pkgs; [
        R
        radianWrapper
        pandoc
        quarto
      ];

      # R packages using rPackages overlay
      rPackages = with pkgs.rPackages; [
        tidyverse
        quanteda
        skimr
      ];

      # TeX Live packages for Quarto rendering
      texlivePackages = with pkgs.texlive.combined.scheme-full; [
        scheme-full
      ];

      # Combine all package lists
      allPackages = packages ++ rPackages ++ texlivePackages;

    in {
      devShell = pkgs.mkShell {
        buildInputs = allPackages; # Use allPackages as input to the development shell
        shellHook = ''
          echo "R development environment activated"
          # R environment setup
          export R_LIBS_USER=$PWD/R/Library;
          mkdir -p "$R_LIBS_USER";
        '';
      };
    });
}
