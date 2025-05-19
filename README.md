# Nix Environments

This repository provides a collection of reproducible development environment templates managed by Nix flakes. These templates are designed to help you quickly set up consistent development environments for various types of projects, ensuring that all dependencies are managed by Nix.

## Available Templates

Currently, the following template is available:

-   **default**: An R programming environment template. This template includes R, common R packages for data science, a Python environment with data science libraries, and tools for working with Quarto.

More templates may be added in the future.

## Usage

To use a template from this repository for your project:

1.  **Ensure you have Nix installed** with flake support enabled.
2.  **Navigate to the root directory of your project** in your terminal.
3.  **Initialize your project's Nix flake** using the desired template from this repository. For example, to use the `default` R template:

    ```bash
    nix flake init -t github:francojc/nix-environments#default
    ```

    Replace `francojc/nix-environments` with the actual GitHub username and repository name if you have forked this repository. Replace `#default` with the name of the template you wish to use if you are using a different one.

    This command will create a `flake.nix` file and potentially other configuration files (like `.envrc`) in your project directory, copying them from the specified template.

4.  **Enter the development environment.**

    -   If you use `direnv` and have it hooked into your shell, navigate into your project directory (or run `direnv allow` if prompted). The environment defined in the generated `.envrc` and `flake.nix` will be automatically loaded.
    -   Alternatively, you can manually enter the development shell using:

        ```bash
        nix develop
        ```

Once inside the development environment, all the tools and libraries specified in the template's `flake.nix` will be available in your shell.

## Contributing

If you have suggestions for new templates or improvements to existing ones, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
