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
- Personal info (email, phone) injected via `.env` — never committed to the repo
- Built with a Docker-based LaTeX environment for reproducibility

## Project Structure

```
.
├── resume.tex                 # CV content (sections, entries, items)
├── clement-omnes-resume.pdf   # Compiled output (auto-committed by CI)
├── config/
│   ├── config.tex             # Package imports
│   ├── style.tex              # Colors, margins, section formatting
│   └── commands.tex           # Custom LaTeX commands
├── .env.example               # Template for local secrets
├── .github/workflows/
│   └── docker-image.yml       # CI: compile and commit PDF on push
├── Dockerfile                 # LaTeX build environment
├── build.sh                   # Build script shortcut
└── LICENSE
```

## Secrets

Personal info is kept out of the repo and injected at build time.

### Local

Copy the example file and fill in your values:

```sh
cp .env.example .env
```

```sh
# .env
PHONE=+33 X XX XX XX XX
PHONE_LINK=+33XXXXXXXXX
LOCAL_OUTPUT_DIR=$HOME/Downloads  # where the PDF is written locally
```

### GitHub Actions

Add `PHONE`, and `PHONE_LINK` as repository secrets:
**Settings → Secrets and variables → Actions → New repository secret**

## Customization

All visual settings are in `config/style.tex`. The color palette at the top of that file controls every text layer:

```latex
\definecolor{colorName}{RGB}{0, 0, 0}       % Big name in header
\definecolor{colorHeader}{RGB}{60, 60, 60}  % Socials / icons row
\definecolor{colorBio}{RGB}{60, 60, 60}     % Short bio text
\definecolor{colorSection}{RGB}{0, 0, 0}    % Section titles + rule
\definecolor{colorEntry}{RGB}{0, 0, 0}      % Org / institution name
\definecolor{colorRole}{RGB}{28, 37, 84}    % Role / degree + dates
\definecolor{colorProject}{RGB}{0, 0, 0}    % Project name + tech stack
\definecolor{colorBody}{RGB}{0, 0, 0}       % Bullet items, descriptions
```

## Building

### Using the build script (recommended)

```sh
./build.sh
```

Requires a `.env` file. The PDF is written to `LOCAL_OUTPUT_DIR` (defaults to `$HOME/Downloads`).

### Using Docker manually

```sh
docker build -t sb2nov/latex .
docker run --rm -i -v "$PWD":/data sb2nov/latex \
    pdflatex -jobname clement-omnes-resume \
    "\def\resumePhoneLink{+33XXXXXXXXX}\def\resumePhone{+33 X XX XX XX XX}\input{resume}"
```

### Using a local LaTeX installation

Make sure you have a full LaTeX distribution installed (e.g. [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/)), then run:

```sh
pdflatex -jobname clement-omnes-resume \
    "\def\resumePhoneLink{+33XXXXXXXXX}\def\resumePhone{+33 X XX XX XX XX}\input{resume}"
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
