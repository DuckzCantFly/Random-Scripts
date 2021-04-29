#! /bin/sh

[ -z "$1" ]\
	&& GAMELOC="$(echo "$0" | rev | cut -d '/' -f 2- | rev)"\
	|| GAMELOC="$1"

[ "$(ls -l "$GAMELOC/nw" | cut -d ' ' -f1)" != "-rwxr-xr-x" ]\
	&& chmod +x "$GAMELOC/nw"

"$GAMELOC/nw"
