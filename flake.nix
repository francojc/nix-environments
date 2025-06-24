{
  description = "A collection of project templates managed by Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  } @ inputs: let
    # Define the available templates
    templates = {
      default = {
        description = "An R programming environment template";
        path = ./templates/default;
      };
      r-quarto = {
        description = "An R programming environment with Quarto website scaffolding";
        path = ./templates/r-quarto;
      };
    };
  in
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      # Define a default development shell for the root of the repository
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          alejandra
          git
          nurl
          shellcheck
          tree
        ];
        shellHook = ''
          echo "Template management environment activated"
          echo "Available templates:"
          echo "- default: An R programming environment template"
          echo "- r-quarto: An R programming environment with Quarto website scaffolding"
          echo "To create a new project from a template, navigate to the desired directory and run 'nix flake init -t github:francojc/nix-environments#template-name'"
        '';
      };
    })
    // {inherit templates;}; # Export templates at the top level
}
