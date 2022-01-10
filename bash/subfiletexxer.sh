#!/bin/bash
#ViM companion for compiling the main file while editing the subfiles in a child folder, to be used together with mkbook. Note that pdflatex is not compatible with what mkbook creates"
usage() {
	echo "USAGE:	subfiletexxer -[m/p/l/x/h]"
	echo "SUPPORTED COMPILERS:	latexmk (m), pdflatex (p), lualatex (l), xelatex (x)"
}
optstring=":hxlpm"
while getopts ${optstring} arg; do
	case ${arg} in
		m)
		for tex in "$(dirname "$(pwd)")"/*; do
			case "$tex" in
				*.tex)
					old=$(pwd)
					cd "$(dirname "$(pwd)")" || exit
					latexmk -pdflua "$tex"
					cd "$old" || exit
			esac
		done;;
		p)
		for tex in "$(dirname "$(pwd)")"/*; do
			case "$tex" in
				*.tex)
					old=$(pwd)
					cd "$(dirname "$(pwd)")" || exit
					latexmk -pdflua "$tex"
					cd "$old" || exit
			esac
		done;;
		l)
		for tex in "$(dirname "$(pwd)")"/*; do
			case "$tex" in
				*.tex)
					old=$(pwd)
					cd "$(dirname "$(pwd)")" || exit
					latexmk -pdflua "$tex"
					cd "$old" || exit
			esac
		done;;
		x)
		for tex in "$(dirname "$(pwd)")"/*; do
			case "$tex" in
				*.tex)
					old=$(pwd)
					cd "$(dirname "$(pwd)")" || exit
					latexmk -pdflua "$tex"
					cd "$old" || exit
			esac
		done;;
		h)
		usage
		;;
		*)
		usage
		;;
	esac
done