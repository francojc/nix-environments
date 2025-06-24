# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository provides reproducible development environment templates managed by Nix flakes. It currently contains:

- A root flake that manages the templates
- Templates for different development environments:
  - `default`: R programming environment with data science tools
  - `r-quarto`: R programming environment with automatic Quarto website scaffolding

## Commands

### Template Management Environment

From the repository root:

**With direnv** (recommended):
```bash
# First time setup
echo "use flake ." > .envrc
direnv allow  # Environment will auto-load when entering directory
```

**Without direnv**:
```bash
nix develop  # Enter template management shell with linting and formatting tools
```

### Formatting and Linting

```bash
alejandra .  # Format Nix files
shellcheck <script>  # Lint shell scripts
```

### Testing Templates

To test a template locally:
```bash
cd /tmp/test-project
nix flake init -t /path/to/nix-environments#default  # or #r-quarto

# With direnv:
echo "use flake ." > .envrc
direnv allow

# Without direnv:
nix develop
```

## Architecture

### Repository Structure

- **Root flake.nix**: Defines available templates and provides a development shell for managing the repository
- **templates/**: Contains individual template directories
  - Each template has its own `flake.nix` and `README.md`
  - Templates are self-contained Nix flakes

### Template System

Templates are exposed through the root flake's `templates` attribute. Each template:
- Has a description and path
- Contains a complete Nix flake setup for a specific development environment
- May include additional files like `.envrc` for direnv integration

### Key Design Decisions

1. **Flake-based**: All environments use Nix flakes for reproducibility and version pinning
2. **Self-contained templates**: Each template is a complete, working flake that can be copied and customized
3. **Language-specific package management**: Templates organize packages by type (general tools, language packages, etc.)
4. **Local package installation**: R template uses project-local R library to avoid system conflicts

## Adding New Templates

1. Create a new directory under `templates/`
2. Add a `flake.nix` with the environment definition
3. Add a `README.md` documenting the template
4. Register the template in the root `flake.nix` templates attribute