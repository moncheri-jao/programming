#!/bin/bash

cc -Wall -pedantic -lm -o derivative.exe derivative.c

python plotter.py &
