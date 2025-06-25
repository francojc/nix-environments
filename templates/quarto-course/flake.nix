{
  description = "A Nix flake for creating an R development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        packages = with pkgs; [
          deno
          pandoc
          quarto
          R
          radianWrapper
        ];

        rPackages = with pkgs.rPackages; [
          # Utils
          languageserver
          tinytex
          # Project
          cleanNLP
          corpora
          dplyr
          factoextra
          fontawesome
          ggplot2
          glue
          googlesheets4
          gt
          janitor
          kableExtra
          knitr
          proxy
          readr
          rmarkdown
          skimr
          stringr
          tidytext
          tidyverse
          udpipe
        ];

        texlivePackages = with pkgs.texlive; [
          (combine {
            inherit scheme-small;
            # Add additional texlive packages here if needed
          })
        ];

        allPackages = packages ++ rPackages ++ texlivePackages;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = allPackages;
          shellHook = ''
            export R_LIBS_USER=$PWD/R/Library; mkdir -p "$R_LIBS_USER";
            echo "R environment set up";
          '';
        };
      });
}
