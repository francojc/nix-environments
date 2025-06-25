# Quarto Course Template

A Nix flake template for creating academic course websites using Quarto with automatic scaffolding and reproducible development environment.

## Quick Start

```bash
# Initialize template in new directory
nix flake init -t github:username/nix-environments#quarto-course

# Enter development environment
echo "use flake ." > .envrc
direnv allow
```

## Customization

### 1. Update Course Information

Edit `_variables.yaml` to customize:

- **Instructor details**: Replace Dr. Sarah McOwen with your information
- **Course details**: Update course title, number, semester, and meeting info
- **URLs**: Replace `[username]` and `[repo-name]` with your GitHub details

### 2. Replace Assets

- `assets/instructor-photo.png` - Your photo (recommended: square, 200x200px)
- `assets/course-sticker.png` - Course logo/sticker
  - Create a hex sticker using [hexSticker](https://github.com/GuangchuangYu/hexSticker) or similar tools

### 3. Update Google Sheets Integration

Edit `schedule.gsheet`:
- Replace `[YOUR_GOOGLE_SHEET_ID]` with your Google Sheets document ID
- Update email address for access permissions

### 4. Customize Content

- `index.qmd` - Main syllabus page
- `slides/` - Lecture slides (remove day-01.qmd or customize)
- `_quarto.yml` - Website configuration and navigation

### 5. Bibliography

Update `slides/bibliography.bib` with your references.

## Development

```bash
# Preview site
quarto preview

# Render site
quarto render

```

## Deployment

The template is configured for GitHub Pages deployment. Update the site URL in `_quarto.yml` to match your repository.

```bash
# Add, commit, and push changes
git add --all 
git commit -m "Deploy site" 
git push origin main 

# Deploy to GitHub Pages
quarto publish gh-pages
```

This will create a `gh-pages` branch with the rendered site, which can be accessed at `https://[username].github.io/[repo-name]` after you enable GitHub Pages in your repository settings and point it to the `gh-pages` branch.
