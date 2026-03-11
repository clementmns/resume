#!/usr/bin/env bash

OUTPUT="clement-omnes-resume"

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
            \"\def\resumePhone{${PHONE}}\def\resumePhoneLink{${PHONE_LINK}}\input{resume}\" &&
        cp /tmp/build/${OUTPUT}.pdf /output/
    "
