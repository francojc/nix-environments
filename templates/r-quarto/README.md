# R Programming Environment with Quarto Website Template

This template provides a reproducible development environment for R projects with automatic Quarto website scaffolding using Nix flakes. It combines the comprehensive R data science environment with pre-configured Quarto website structure, making it ideal for creating data-driven websites, blogs, or documentation sites.

## Included Packages

This environment includes all packages from the default R template plus automatic website initialization:

- **Core R and Utilities:**
  - **R**: The core R statistical programming language.
  - **radianWrapper**: An enhanced command-line interface for R.
  - **direnv**: Automatically loads and unloads the Nix development environment.
  - **git**: Version control system.
  - **gh**: GitHub CLI for interacting with GitHub.
  - **nurl**: Utility to generate Nix fetcher calls from URLs.

- **R Data Science Ecosystem (tidyverse):**
  - **tidyverse**: Meta-package including dplyr, ggplot2, tidyr, and other essential data science packages.

- **R Development and Tooling:**
  - **languageserver**: LSP implementation for R, enabling IDE features.
  - **devtools**: Package development tools.

- **Reproducible Reporting and Publishing (Quarto):**
  - **Quarto**: Scientific and technical publishing system with automatic website scaffolding.
  - **rmarkdown**, **knitr**: Core packages for executing R code and rendering documents.
  - **TeX Live**: Comprehensive TeX distribution for PDF rendering.

- **Integrated Python Environment:**
  - **Python 3** with **numpy**, **pandas**, **matplotlib**, **jupyterlab**, and **ipython**.

## Automatic Website Initialization

When you first enter the development environment, this template will automatically:

1. Check if a Quarto website already exists in the current directory
2. If not, initialize a new Quarto website project with default scaffolding
3. Create the necessary configuration files (`_quarto.yml`, `index.qmd`, etc.)
4. Set up the basic website structure

The automatic initialization only happens once - subsequent entries into the environment will skip this step if `_quarto.yml` already exists.

## Possible Uses

This template is perfect for:

- **Data Science Websites:** Create websites showcasing data analysis, visualizations, and insights.
- **Research Blogs:** Publish reproducible research findings with integrated code and results.
- **Documentation Sites:** Build comprehensive documentation for R packages or data projects.
- **Portfolio Sites:** Showcase data science projects with interactive elements.
- **Course Materials:** Create educational websites with embedded R code and exercises.
- **Lab Websites:** Academic research group websites with integrated publications and resources.

## Getting Started

To use this template for a new project:

1. Navigate to your desired project directory
2. Initialize the template:
   ```bash
   nix flake init -t github:francojc/nix-environments#r-quarto
   ```
3. Enter the environment (with direnv):
   ```bash
   echo "use flake ." > .envrc
   direnv allow
   ```
   Or manually:
   ```bash
   nix develop
   ```
4. Start the Quarto development server:
   ```bash
   quarto preview
   ```

## Customization

After initialization, you can customize your website by:

- Editing `_quarto.yml` to configure site settings, themes, and navigation
- Modifying `index.qmd` to create your homepage content
- Adding new `.qmd` files for additional pages
- Customizing the `flake.nix` to add or remove packages as needed

The R packages are installed into a local library (`./R/Library`) to ensure project isolation and avoid system conflicts.

## Quarto Website Features

The initialized website includes:

- Responsive design with customizable themes
- Automatic navigation generation
- Support for R, Python, and other code execution
- Built-in search functionality
- Social media integration options
- RSS feed generation
- Multi-format publishing (HTML, PDF, etc.)