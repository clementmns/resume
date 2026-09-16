#!/usr/bin/env bash

# Usage: ./build.sh [variant]
#   ./build.sh              -> resume.tex
#   ./build.sh resume-bank  -> resume-bank.tex

VARIANT="${1:-resume}"
VARIANT="${VARIANT%.tex}"

if [ ! -f "${VARIANT}.tex" ]; then
    echo "error: ${VARIANT}.tex not found" >&2
    exit 1
fi

if [ "$VARIANT" = "resume" ]; then
    OUTPUT="clement-omnes-resume"
else
    OUTPUT="clement-omnes-${VARIANT}"
fi

if [ -f .env ]; then
    source .env
fi

PHONE="${PHONE:-}"
PHONE_LINK="${PHONE_LINK:-}"
LOCAL_OUTPUT_DIR="${LOCAL_OUTPUT_DIR:-$HOME/Downloads}"

docker build -t sb2nov/latex .
docker run --rm -i \
    -v "$PWD":/data \
    -v "${LOCAL_OUTPUT_DIR}":/output \
    sb2nov/latex \
    sh -c "
        mkdir -p /tmp/build &&
        pdflatex -jobname \"${OUTPUT}\" -output-directory /tmp/build \
            \"\def\resumePhone{${PHONE}}\def\resumePhoneLink{${PHONE_LINK}}\input{${VARIANT}}\" &&
        cp /tmp/build/${OUTPUT}.pdf /output/
    "
