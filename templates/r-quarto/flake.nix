{
  description = "An R programming environment with Quarto website scaffolding";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
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
      texlivePackages = with pkgs.texlive; [
        (combine {
          inherit scheme-small;
          # Add additional texlive packages here if needed
        })
      ];

      # Combine all package lists
      allPackages = packages ++ rPackages ++ [pythonEnv] ++ texlivePackages;
    in {
      devShell = pkgs.mkShell {
        buildInputs = allPackages;
        shellHook = ''
          echo "R development environment with Quarto website activated"
          # R environment setup
          export R_LIBS_USER=$PWD/R/Library;
          mkdir -p "$R_LIBS_USER";
          
          # Check if Quarto website already exists
          if [ ! -f "_quarto.yml" ]; then
            echo "Initializing Quarto website..."
            ${pkgs.quarto}/bin/quarto create project website . --no-prompt --no-open
            echo "Quarto website scaffolding created!"
            echo "Run 'quarto preview' to start the development server"
          else
            echo "Quarto website already initialized"
          fi
        '';
      };
    });
}