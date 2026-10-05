[![CI](https://github.com/alessandrocandolini/concurrency-handout/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/concurrency-handout/actions/workflows/ci.yml)

# Mathematical Theory of Shared-Memory Concurrency: A Short Compendium

Notes about concurrency, typeset with KOMA-Script (`scrbook`) and ClassicThesis,
using the layout and pinned toolchain from `notes-hypergeometric`.

## Compile

With TeX Live (or MacTeX), Biber, and Make installed:

```bash
make build
```

Alternatively, use the pinned Nix environment, which includes full TeX Live,
Asymptote, and BibTool:

```bash
nix develop
make build
```

To build directly in the pinned environment:

```bash
nix develop --no-update-lock-file --command make build
```

The output is `concurrency-handout.pdf`. After first adding the flake files to a
Git checkout, stage `flake.nix` and `flake.lock` so Nix can see them. For an
unstaged checkout, use `nix develop path:. --no-update-lock-file --command make build`.

To remove generated LaTeX files and the PDF:

```bash
nix develop --no-update-lock-file --command make clean
```

## Layout and bibliography

`concurrency-handout.tex` assembles the document. `setup.tex` configures
ClassicThesis, Euler maths, hyperlinks, and bibliography formatting.
`FrontBackmatter/` contains the title pages, contents, preface, and bibliography;
`Chapters/` contains the existing topics, with one chapter per former top-level
section. Sources use UTF-8 encoding.

Edit `bibliography.bib` to maintain references. Citations use BibLaTeX's
`philosophy-modern` style with Biber, square brackets, small-cap author names,
and back references, matching `notes-hypergeometric`. `latexmk` runs Biber as
needed. Only cited entries appear in the bibliography; the current draft has
no citations yet.

## CI/CD

GitHub Actions runs `make build` in the same pinned Nix environment. The standard
Nix store is cached using `nix-community/cache-nix-action`, keyed by the runner
OS, architecture, and hashes of `flake.nix` and `flake.lock`.

Builds on `main` publish the PDF in a timestamped GitHub release.
