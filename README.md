# Clément Omnès — Resume

A clean, ATS-friendly résumé written in LaTeX.

## Preview

> See [`clement-omnes-resume.pdf`](./clement-omnes-resume.pdf) for the latest build.

## Features

- A4 paper format, 11pt font
- ATS-parsable (machine-readable PDF via `glyphtounicode`)
- Custom commands for consistent formatting and hierarchy
- Icons via `fontawesome5`
- Built with a Docker-based LaTeX environment for reproducibility

## Project Structure

```
.
├── clement-omnes-resume.tex   # Main resume source file
├── clement-omnes-resume.pdf   # Compiled output
├── Dockerfile                 # LaTeX build environment
├── build.sh                   # Build script shortcut
└── LICENSE
```

## Building

### Using Docker (recommended)

Build the Docker image once:

```sh
docker build -t latex .
```

Then compile the resume:

```sh
docker run --rm -i -v "$PWD":/data latex pdflatex clement-omnes-resume.tex
```

Or use the provided build script:

```sh
./build.sh
```

### Using a local LaTeX installation

Make sure you have a full LaTeX distribution installed (e.g. [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/)), then run:

```sh
pdflatex clement-omnes-resume.tex
```

## Dependencies

The following LaTeX packages are required (all included in `texlive-latex-extra` and `texlive-fonts-extra`):

| Package | Purpose |
|---|---|
| `fullpage` | Page layout and margins |
| `fancyhdr` | Header/footer control |
| `titlesec` | Section title formatting |
| `enumitem` | List customization |
| `babel` | Language support |
| `inputenc` / `fontenc` | UTF-8 encoding |
| `lato` | Main font |
| `fontawesome5` | Icons |
| `color` | Text and rule colors |
| `hyperref` | Clickable links |
| `graphicx` | Icon scaling |

## License

MIT © [Clément Omnès](https://clementomnes.dev)