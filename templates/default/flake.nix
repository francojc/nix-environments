{
  description = "An R programming environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github.com/numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      # Define general development packages
      packages = with pkgs; [
        R
        direnv
        gh
        git
        nurl
        pandoc
        quarto
        radianWrapper
      ];

      # R packages using rPackages overlay
      rPackages = with pkgs.rPackages; [
        tidyverse
        languageserver
        rmarkdown
        knitr
        devtools
      ];

      # Python environment
      pythonEnv = pkgs.python3.withPackages (ps:
        with ps; [
          numpy
          pandas
          matplotlib
          jupyterlab
          ipython
        ]);

      # TeX Live packages for Quarto rendering
      texlivePackages = {
        inherit
          (pkgs.texlive)
          scheme-medium
          fancyhdr
          geometry
          hyperref
          ;
      };

      # Combine all package lists
      allPackages = packages ++ rPackages ++ [pythonEnv] ++ texlivePackages;
    in {
      devShell = pkgs.mkShell {
        buildInputs = allPackages;
        shellHook = ''
          echo "R development environment activated"
          # R environment setup
          export R_LIBS_USER=$PWD/R/Library;
          mkdir -p "$R_LIBS_USER";
        '';
      };
    });
}
