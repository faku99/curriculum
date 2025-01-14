#!/bin/bash

BUILD_DIR=build

mkdir -p ${BUILD_DIR}

pdflatex --output-directory=${BUILD_DIR} -halt-on-error main.tex