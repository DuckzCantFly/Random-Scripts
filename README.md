# Random-Scripts
A collection of random scripts I use on my computer, in no order, at all.

## bgc
Automatically switches background depending on time of day and season.
### Requires:
	* luke smiths script setbg
	* my script bgctimer
	* zsh, there is some weird behaviore adding numbers with floating zeros in bash so uses zsh instead
	* and probably some other stuff i dont know about but you probably allready have
*upgrading this massively and re-writing it in go*

## bgctimer
Script needed for bgctimer.

## piv
Opens image files from epub in sxiv.
### Requires:
	* sxiv
	* unzip
	* optionaly xrander
	* and maybe some otherstuff

## epr
Vary basic epub viewer for the terminal using epub2txt and less. This breaks with spaces in file so use underscores instead and the script here named underscored can help with that!
Also this saves all every file you previously opened to /tmp/epr by default for fast reopening, but obviously there all gone on system restart. So if you want to keep them you can change the argument for the first variable in the program EPUBSTORAGE="/tmp/epr" to something more permanent like "$HOME/books/txt" and everything should work the same 
### Requires:
	* epub2txt
	* less
	* and some other stuff you probably have installed already

## underscored
A little script I stole from stack exchange or something and tweeked a bit, replaces spaces with underscores. Its amazing, so I have to put it here but i don't clam it as entirely mine but its so short I don't think it really matters just use it and be wowed.
### Usage
	-R targets all files and folders recursivly (might need to run a few times to catch all of em, is a little hacky)

## rot
Easly rotate screen from the cmdline using xrander.
### Requires:
	* xrander
	* maybe some other stuff

## unzipper
A little mass unzipping script that uses unzip.
### Requires:
	* uzip

## timer
A very simple timer using termdown
*does not currently come with chime sound, will get a good one I have full rights to later but it's easy to add your own in the meantime*
### usage
	timer ss mm hh
	ex.
	timer 0 5 200
### Requires:
	* termdown
	* lolcat *so it looks less boring*
	* paplay

## lim
Wrapper for less with proper word wrapping

## sfs
Awesome wrapper for sshfs that lets you quickly mount and unmount known remote file systems quickly
### usage
	no argument, start/restart all remote file systems 
	-k kill running remote file systems and unmount them
	$1,$2,$n add new remote file system listed in ~/.ssh/config
### Requires:
	* sshfs
	* procps-ng

## mksh 
small bootstrap script for writing shell scripts

## epbthumb
crapy un-readable script I use to get epub thumbnails in lf

## etpr
weird script for repackaging epr files smaller files no one but would use but me (better format for epub readers sometimes then standard epubs)

## pubrp
script for attempting to properly repackage epubs moving apple garbage to later in the file so it displays proper metadata and index first (only works fully sometimes)

## rmd
crappy wrapper for rm and rmdir, I don't even use, keep it for nostalgia, maybe I'll fix it one day

## se 
scrip I stole from Luke Smith and modified, so probably maybe might use a different license, I don't know or care, it's a wrapper for fzf. I would die without this on my computer.

## tts
scrip I use to get tts honestly only reason it's a thing is so, I don't have to recompile dwm if I want to tweak my tts.

## tts2
wrapper to fix svox arch package is its broken and I don't know enough python to patch it. Someone should though.