# Clément Omnès — Resume

A clean, ATS-friendly résumé written in LaTeX.

## Preview

> See [`clement-omnes-resume.pdf`](./clement-omnes-resume.pdf) for the latest build.

## Features

- A4 paper format, 9pt font
- ATS-parsable (machine-readable PDF via `glyphtounicode`)
- Custom commands for consistent formatting and hierarchy
- Fully themeable color palette via `config/style.tex`
- Icons via `fontawesome5`
- Built with a Docker-based LaTeX environment for reproducibility

## Project Structure

```
.
├── resume.tex                 # CV content (sections, entries, items)
├── clement-omnes-resume.pdf   # Compiled output (named via OUTPUT in build.sh)
├── config/
│   ├── config.tex             # Package imports
│   ├── style.tex              # Colors, margins, section formatting
│   └── commands.tex           # Custom LaTeX commands
├── Dockerfile                 # LaTeX build environment
├── build.sh                   # Build script shortcut
└── LICENSE
```

## Customization

All visual settings are in `config/style.tex`. The color palette at the top of that file controls every text layer:

## Building

### Using Docker (recommended)

Build the Docker image once:

```sh
docker build -t latex .
```

Then compile the resume:

```sh
docker run --rm -i -v "$PWD":/data latex pdflatex -jobname clement-omnes-resume resume.tex
```

Or use the provided build script:

```sh
./build.sh
```

### Using a local LaTeX installation

Make sure you have a full LaTeX distribution installed (e.g. [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/)), then run:

```sh
pdflatex -jobname clement-omnes-resume resume.tex
```

## Dependencies

The following LaTeX packages are required (all included in `texlive-latex-extra` and `texlive-fonts-extra`):

| Package | Purpose |
|---|---|
| `fullpage` | Page layout and margins |
| `fancyhdr` | Header/footer control |
| `titlesec` | Section title formatting |
| `enumitem` | List customization |
| `etoolbox` | Conditional commands |
| `babel` | Language support |
| `inputenc` / `fontenc` | UTF-8 encoding |
| `lato` | Main font (Lato) |
| `fontawesome5` | Icons |
| `xcolor` | Text and rule colors |
| `hyperref` | Clickable links |
| `graphicx` | Icon scaling |

## License

MIT © [Clément Omnès](https://clementomnes.dev)
