[![CI](https://github.com/alessandrocandolini/concurrency-handout/actions/workflows/ci.yml/badge.svg)](https://github.com/alessandrocandolini/concurrency-handout/actions/workflows/ci.yml)

# Six not so easy pieces in concurrency

## Compile

Assuming a standard LaTeX distribution (eg, texlive) and `asymptote`, 
```bash
latexmk -pdflatex concurrency-handout.tex
```

Notice: Depending on the LaTeX distribution, asymptote might require independent installation.

One way to install a LaTeX distribution is via `nix`, for example using an ephemeral nix shell: 
```bash
nix-shell -p texlive.combined.scheme-full asymptote
```
(here, the full distribution is used)

## CI/CD 

This project uses github actions. `setup-texlive-action` does not install `asymptote` though, so instead of using `setup-texlive-action` the project uses `nix` also in github actions. A custom location for the nix store is used, in order to cache it. The size of texlive full is quite big, so the cache is ~2GB and takes ~1 minute to load. 

The artifact is published in the release tags
