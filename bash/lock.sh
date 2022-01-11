#!/bin/bash
# kill all concurring instances of xidlehook
if pgrep xidlehook; then
	killall xidlehook
	xidlehook --timer 1500 \
		'brightnessctl --save; brightnessctl set 10%' \
		'brightnessctl --restore' \
	    --timer 200 \
		'/bin/locker' \
		'xset dpms force off' \
		'brightnessctl --restore' \
	&
else
# dim the screen after 150s (2.5 min)
	xidlehook --timer 1500 \
		'brightnessctl --save; brightnessctl set 10%' \
		'brightnessctl --restore' \
	    --timer 200 \
		'/bin/locker' \
		'xset dpms force off' \
		'brightnessctl --restore' \
	&
fi
#	xidlehook --timer 1500 'brightnessctl --save; brightnessctle set 10%' 'brightnessctl --restore' --timer 200 'locker' 'xset dpms force off''brightnessctl --restore' &
