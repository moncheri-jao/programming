#bin/bash
# DIRECTORY ORGANIZER FOR TEX SUBFILES
#To be used together with mkbook
usage () {
	echo "USAGE:		 texall -option"
	echo "OPTIONS:		-a	Compile all the tex files in the directory and move EVERY product into specialized folders, .tex files included"
	echo "			--nopdf	Compile all the tex files in the directory and leave in the parent directory both .tex and .pdf files"
	echo "			-h	Show this print"
}
if  [ -n "$1" ]; then
	case "$1" in
		-a)
			for f in $(pwd)/*; do
				case $f in
					*.tex)
						latexmk -pdflua $f;;
				esac
			done
			for f in $(pwd)/*; do
				case $f in
					*.aux)
						if [ ! -d "aux" ]; then
							mkdir $(pwd)/aux
						fi
						mv $f $(pwd)/aux;;
					*.bbl)
						if [ ! -d "bbl" ]; then
							mkdir $(pwd)/bbl
						fi
						mv $f $(pwd)/bbl;;
					*.bcf)
						if [ ! -d "bcf" ]; then
							mkdir $(pwd)/bcf
						fi
						mv $f $(pwd)/bcf;;
					*.blg)
						if [ ! -d "blg" ]; then
							mkdir $(pwd)/blg
						fi
						mv $f $(pwd)/blg;;
					*.fdb*)
						if [ ! -d "fdb" ]; then
							mkdir $(pwd)/fdb
						fi
						mv $f $(pwd)/fdb;;
					*.fls)
						if [ ! -d "fls" ]; then
							mkdir $(pwd)/fls
						fi
						mv $f $(pwd)/fls;;
					*.log)
						if [ ! -d "log" ]; then
							mkdir $(pwd)/log
						fi
						mv $f $(pwd)/log;;
					*.out)
						if [ ! -d "out" ]; then
							mkdir $(pwd)/out
						fi
						mv $f $(pwd)/out;;
					*.xml)
						if [ ! -d "xml" ]; then
							mkdir $(pwd)/xml
						fi
						mv $f $(pwd)/xml;;
					*.pdf)
						if [ ! -d "pdf" ]; then
							mkdir $(pwd)/pdf
						fi
						mv $f $(pwd)/pdf;;
					*.tex)
						if [ ! -d "tex" ]; then
							mkdir $(pwd)/tex
						fi
						mv $f $(pwd)/tex;;
				esac
			done;;
		--nopdf)
			for f in $(pwd)/*; do
				case $f in
					*.tex)
						latexmk -pdflua $f;;
				esac
			done
			for f in $(pwd)/*; do
	    		case $f in
	    			*.aux)
	    				if [ ! -d "aux" ]; then
	    					mkdir $(pwd)/aux
	    				fi
	    				mv $f $(pwd)/aux;;
	    			*.bbl)
	    				if [ ! -d "bbl" ]; then
	    					mkdir $(pwd)/bbl
	    				fi
	    				mv $f $(pwd)/bbl;;
	    			*.bcf)
	    				if [ ! -d "bcf" ]; then
	    					mkdir $(pwd)/bcf
	    				fi
	    				mv $f $(pwd)/bcf;;
	    			*.blg)
	    				if [ ! -d "blg" ]; then
	    					mkdir $(pwd)/blg
	    				fi
	    				mv $f $(pwd)/blg;;
	    			*.fdb*)
	    				if [ ! -d "fdb" ]; then
	    					mkdir $(pwd)/fdb
	    				fi
	    				mv $f $(pwd)/fdb;;
	    			*.fls)
	    				if [ ! -d "fls" ]; then
	    					mkdir $(pwd)/fls
	    				fi
	    				mv $f $(pwd)/fls;;
	    			*.log)
	    				if [ ! -d "log" ]; then
	    					mkdir $(pwd)/log
	    				fi
	    				mv $f $(pwd)/log;;
	    			*.out)
	    				if [ ! -d "out" ]; then
	    					mkdir $(pwd)/out
	    				fi
	    				mv $f $(pwd)/out;;
	    			*.xml)
	    				if [ ! -d "xml" ]; then
	    					mkdir $(pwd)/xml
	    				fi
	    				mv $f $(pwd)/xml;;
	    		esac
	    	done
	    	for f in $(pwd)/*; do
	    		case $f in
	    			*.aux)
	    				if [ ! -d "aux" ]; then
	    					mkdir $(pwd)/aux
	    				fi
	    				mv $f $(pwd)/aux;;
	    			*.bbl)
	    				if [ ! -d "bbl" ]; then
	    					mkdir $(pwd)/bbl
	    				fi
	    				mv $f $(pwd)/bbl;;
	    			*.bcf)
	    				if [ ! -d "bcf" ]; then
	    					mkdir $(pwd)/bcf
	    				fi
	    				mv $f $(pwd)/bcf;;
	    			*.blg)
	    				if [ ! -d "blg" ]; then
	    					mkdir $(pwd)/blg
	    				fi
	    				mv $f $(pwd)/blg;;
	    			*.fdb*)
	    				if [ ! -d "fdb" ]; then
	    					mkdir $(pwd)/fdb
	    				fi
	    				mv $f $(pwd)/fdb;;
	    			*.fls)
	    				if [ ! -d "fls" ]; then
	    					mkdir $(pwd)/fls
	    				fi
	    				mv $f $(pwd)/fls;;
	    			*.log)
	    				if [ ! -d "log" ]; then
	    					mkdir $(pwd)/log
	    				fi
	    				mv $f $(pwd)/log;;
	    			*.out)
	    				if [ ! -d "out" ]; then
	    					mkdir $(pwd)/out
	    				fi
	    				mv $f $(pwd)/out;;
	    			*.xml)
	    				if [ ! -d "xml" ]; then
	    					mkdir $(pwd)/xml
	    				fi
	    				mv $f $(pwd)/xml;;
	    			*.pdf)
	    				if [ ! -d "pdf" ]; then
	    					mkdir $(pwd)/pdf
	    				fi
	    				mv $f $(pwd)/pdf;;
	    		esac
	    	done;;
	-h)
		usage;;
	esac
else
	usage
	exit
fi
