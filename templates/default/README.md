# R Programming Environment Template

This template provides a reproducible development environment for R projects using Nix flakes. It is designed to be a comprehensive environment for data analysis, statistical modeling, and report generation using R and Quarto.

## Included Packages

This environment includes a curated set of packages to support a wide range of R-based workflows:

-   **Core R and Utilities:**
    -   **R**: The core R statistical programming language.
    -   **radianWrapper**: An enhanced command-line interface for R, offering features like syntax highlighting and improved tab completion.
    -   **direnv**: Automatically loads and unloads the Nix development environment when you navigate into and out of the project directory.
    -   **git**: The standard version control system.
    -   **gh**: GitHub CLI for interacting with GitHub from the command line.
    -   **nurl**: A utility to generate Nix fetcher calls from URLs.

-   **R Data Science Ecosystem (tidyverse):**
    -   **tidyverse**: A meta-package that includes a collection of packages essential for data science, including:
        -   `dplyr`: For data manipulation.
        -   `ggplot2`: For data visualization.
        -   `tidyr`: For tidying data.
        -   And many others for importing, wrangling, and modeling data.

-   **R Development and Tooling:**
    -   **languageserver**: Provides a Language Server Protocol (LSP) implementation for R, enabling features like code completion, diagnostics, and hover information in compatible editors (like Neovim or VS Code).
    -   **devtools**: A collection of packages that make package development easier, including functions for building, checking, and installing packages.

-   **Reproducible Reporting and Publishing (Quarto):**
    -   **Quarto**: An open-source scientific and technical publishing system that allows you to create dynamic documents, reports, presentations, and websites from R, Python, and other languages.
    -   **rmarkdown**, **knitr**: Core packages used by Quarto for executing R code and rendering documents.
    -   **TeX Live (scheme-medium, fancyhdr, geometry, hyperref)**: A comprehensive TeX distribution and essential packages required by Quarto to render documents to PDF format.

-   **Integrated Python Environment:**
    -   **Python 3**: A Python environment is included with key libraries for data science, facilitating workflows that involve both R and Python.
    -   **numpy**: The fundamental package for scientific computing with Python.
    -   **pandas**: A powerful library for data manipulation and analysis.
    -   **matplotlib**: A widely used plotting library for creating static, interactive, and animated visualizations in Python.
    -   **jupyterlab**, **ipython**: Provides an interactive computing environment, useful for exploring data and prototyping code in Python.

## Possible Uses

This template is well-suited for a variety of projects, including:

-   **Data Analysis Projects:** Perform data cleaning, transformation, analysis, and visualization using the tidyverse and integrated Python libraries.
-   **Statistical Modeling:** Build and evaluate statistical models using R's extensive statistical capabilities.
-   **Reproducible Research:** Create dynamic reports, papers, and presentations using Quarto, ensuring that your analysis and results are reproducible.
-   **R Package Development:** Develop and test your own R packages within a consistent environment.
-   **Learning and Experimentation:** Provide a ready-to-go environment for learning R, Python, data science, and Quarto.

## Getting Started

To use this template for a new project, follow the instructions in the main repository's [README.md](../README.md).

## Customization

You can customize this environment by editing the `flake.nix` file in your project directory after initializing the template. You can add or remove packages from the various lists (`packages`, `rPackages`, `pythonEnv`, `texlivePackages`) to tailor the environment to your specific project needs.

The R packages are installed into a local library within the project directory (`./R/Library`) to avoid conflicts with your system's R installation and to ensure project-specific dependencies.
