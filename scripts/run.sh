#! /bin/sh
# a little script to try to fix rpgmaker games

if [ -z "$1" ] ; then
	GAMELOC="$(echo "$0" | rev | cut -d '/' -f 2- | rev)"\
	else
	GAMELOC="$1"
fi

[ -x "$GAMELOC/nw" ]\
	&& chmod +x "$GAMELOC/nw"

"$GAMELOC/nw"

# if that doesnt work try :
# mkdir fonts; echo '<fontconfig><dir>/usr/share/fonts</dir><cachedir>fonts</cachedir></fontconfig>' >fonts/fonts.conf; FONTCONFIG_PATH=fonts ./nw # %command%
# from https://forums.rpgmakerweb.com/index.php?threads/playtest-not-working-on-ubuntu-18-04.94710/
