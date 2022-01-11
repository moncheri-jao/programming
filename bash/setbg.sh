#!/bin/bash
usage () {
	echo "set a new background for i3 with pywal"
	echo "USAGE:	-n(ew) set a new background"
	echo "      	-r(eload) reload pywal sequences"
	echo "      	-o rerun pywal on the previously saved background"
	echo "     	-h(elp) show this dialog"
}
optstring=":hron"
while getopts ${optstring} arg; do
    case "${arg}" in
	n)  cp "$(pwd)/$2" "$HOME/.config/i3/background"
	    convert "$HOME/.config/i3/background" "$HOME/.config/i3/background.png"
	    wal -i "$HOME/.config/i3/background.png"
	    ;;
	o)  wal -i "$HOME/.config/i3/background.png"
	    ;;
	r)  cat "$HOME"/.cache/wal/sequences
	;;
	h)  usage
	;;	    
	*)  usage
	;;  
    esac
done
#	    convert /$HOME/.config/i3/background.png lock.png # -font FiraMono -pointsize 26 -fill white -gravity center -annotate +0+160 "Type Password to Unlock" lock.png #-gravity center -composite newimage.png
