#!/bin/bash
pdflatex 00_main && biber 00_main && pdflatex 00_main && pdflatex 00_main
