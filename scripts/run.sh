#! /bin/sh

if [ -z "$1" ] ; then
	GAMELOC="$(echo "$0" | rev | cut -d '/' -f 2- | rev)"\
	else
	GAMELOC="$1"
fi

[ -x "$GAMELOC/nw" ]\
	&& chmod +x "$GAMELOC/nw"

"$GAMELOC/nw"
