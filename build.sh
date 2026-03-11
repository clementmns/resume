#!/usr/bin/env bash

OUTPUT="clement-omnes-resume"

docker build -t sb2nov/latex .
docker run --rm -i -v "$PWD":/data sb2nov/latex pdflatex -jobname "${OUTPUT}" resume.tex
