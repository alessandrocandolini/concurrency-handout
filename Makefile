.PHONY: build clean

build:
	latexmk -g -pdf -interaction=nonstopmode -halt-on-error concurrency-handout.tex

clean:
	latexmk -C concurrency-handout.tex
