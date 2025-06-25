# Plantilla de Curso Quarto

Una plantilla Nix flake para crear sitios web de cursos académicos usando Quarto con configuración automática y entorno de desarrollo reproducible.

## Inicio Rápido

```bash
# Inicializar plantilla en nuevo directorio
nix flake init -t github:username/nix-environments#quarto-curso

# Entrar al entorno de desarrollo
echo "use flake ." > .envrc
direnv allow
```

## Personalización

### 1. Actualizar Información del Curso

Edita `_variables.yaml` para personalizar:

- **Detalles del instructor**: Reemplaza Dr. Carmen García con tu información
- **Detalles del curso**: Actualiza título, código, semestre e información de reuniones
- **URLs**: Reemplaza `[username]` y `[repo-name]` con tus detalles de GitHub

### 2. Reemplazar Assets

- `assets/instructor-photo.jpg` - Tu foto (recomendado: cuadrada, 200x200px)
- `assets/course-sticker.png` - Logo/sticker del curso

### 3. Actualizar Integración Canvas

Edita `_variables.yaml` sección `canvas`:
- Reemplaza `[university]` con el nombre de tu universidad
- Actualiza `[COURSE_ID]` y `[ASSIGNMENT_ID]` con los IDs correspondientes

### 4. Personalizar Contenido

- `index.qmd` - Página principal del programa
- `diapositivas/` - Presentaciones de clase (personaliza diap-01.qmd o _template.qmd)
- `planes/` - Planes de lección
- `actividades/` - Actividades del curso
- `_quarto.yml` - Configuración del sitio web y navegación

### 5. Bibliografía

Actualiza `diapositivas/bibliography.bib` con tus referencias (si está vacío, añade las tuyas).

## Desarrollo

```bash
# Vista previa del sitio
quarto preview

# Renderizar sitio
quarto render

# Formatear código
alejandra .
```

## Despliegue

La plantilla está configurada para despliegue en GitHub Pages. Actualiza la URL del sitio en `_quarto.yml` para que coincida con tu repositorio.

```bash
# Añadir, commit y push de cambios
git add --all
git commit -m "Deploy site"
git push origin main

# Desplegar a GitHub Pages
quarto publish gh-pages
```

Esto creará una rama `gh-pages` con el sitio renderizado, que se puede acceder en `https://[username].github.io/[repo-name]` después de habilitar GitHub Pages en la configuración de tu repositorio y apuntarlo a la rama `gh-pages`.

## Estructura del Curso

La plantilla incluye:

- **Programa del curso** (`index.qmd`) - Información completa del curso en español
- **Horario** (`horario.qmd`) - Cronograma del semestre
- **Planes de lección** (`planes/`) - Plantillas para planes de clase
- **Diapositivas** (`diapositivas/`) - Presentaciones con tema personalizado
- **Actividades** (`actividades/`) - Ejercicios y tareas del curso
- **Integración Canvas** - Enlaces configurables a tu LMS