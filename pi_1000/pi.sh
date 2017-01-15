#!/bin/bash
pi 100000 | \
  tr -cd '[[:digit:]]' | \
  tr '[0-9]' '[A-J]' | \
  sed -e 's/A/255 102 77 /g' \
      -e 's/B/252 160 74 /g' \
      -e 's/C/255 225 67 /g' \
      -e 's/D/103 217 76 /g' \
      -e 's/E/32 210 231 /g' \
      -e 's/F/39 210 231 /g' \
      -e 's/G/61 153 246 /g' \
      -e 's/H/12 106 199 /g' \
      -e 's/I/186 51 214 /g' \
      -e 's/J/249 112 191 /g' | \
  cat <(echo P3 400 250 255) - | \
  convert ppm:- -filter box -resize 800% pi-100k.png