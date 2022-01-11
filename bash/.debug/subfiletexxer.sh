#bin/bash
#ViM companion for compiling the main file while editing the subfiles in a child folder, to be used together with mkbook. Note that pdflatex is not compatible with what mkbook creates"
usage() {
	echo "USAGE:	subfiletexxer -COMPILER"
	echo "SUPPORTED COMPILERS:	latexmk, pdflatex, lualatex, xelatex"
}
case $1 in
	-latexmk)
		for tex in "$(dirname $(pwd))"/*; do
			case "$tex" in
				*.tex)
					$old=$(pwd)
					cd "$(dirname $(pwd))"
					latexmk -pdflua $tex
					cd "$old"
			esac
		done;;
	-pdflatex)
		for tex in "$(dirname $(pwd))"/*; do
			case "$tex" in
				*.tex)
					$old=$(pwd)
					cd "$(dirname $(pwd))"
					pdflatex $tex
					cd "$old"
			esac
		done;;
	-lualatex)
		for tex in "$(dirname $(pwd))"/*; do
			case "$tex" in
				*.tex)
					$old=$(pwd)
					cd "$(dirname $(pwd))"
					lualatex $tex
					cd "$old"
			esac
		done;;
	-xelatex)
		for tex in "$(dirname $(pwd))"/*; do
			case "$tex" in
				*.tex)
					$old=$(pwd)
					cd "$(dirname $(pwd))"
					xelatex -pdflua $tex
					cd "$old"
			esac
		done;;
	*)
		usage;;
	-h)
		usage;;
esac
