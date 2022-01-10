#!/bin/bash
function bgpath ()
{
	local bg="$HOME/.config/i3/background.png"
	wal -qi "$bg"
}
bgpath
#wal -qi $bgpath
