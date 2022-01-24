#!/bin/bash

cc -Wall -pedantic -lm -o derivative.exe derivative.c # compile the file using the system's c compiler
./derivative.exe                                      # execute the generated executable and generate the file catched by the python scripts
python plotter.py &# execute the python script in background, leave only the plotted graph
