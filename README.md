# Random-Scripts
A collection of random scripts I use on my computer.

# Epub/Ebook Stuff 

## epr
Vary basic epub viewer for the terminal using epub2txt and less. This script breaks with spaces in file names, so use underscores instead and the script here named underscored can help with that!

### Requires:
	* epub2txt
	* less
	* and some other stuff you probably have installed already

## piv
Opens image files from epub in sxiv. This script breaks with spaces in file names, so use underscores instead and the script here named underscored can help with that!

### Requires:
	* sxiv
	* unzip
	* optionaly xrander for screen rotation
	* and maybe some otherstuff

## lim
Wrapper for less with proper word wrapping

## etrp
Weird script for repackaging epubs as files as smaller zip files containing ordered raw text. No one would use this but me (better format for epub readers if epub was weirdly packaged originaly)
### Requires:
	* epub2txt

## pubrp
Script for attempting to properly repackage epubs moving apple garbage to later in the file, so it displays proper metadata with the index first (only works fully sometimes)

## epbthumb
Crappy un-readable script I use to get epub thumbnails in lf *you should ignore this*

# Wallpeper & Theme

## bgc
Automatically switches background depending on time of day and season.
### Requires:
	* luke smiths script setbg
	* my script bgctimer
	* and probably some other stuff i dont know about but you probably allready have
*upgrading this massively and re-writing it in go*

## bgctimer
Script needed for bgctimer.

## setbg
Modified versions of luke smiths setbg, with better ricing capability
Also uses gplv3 kus luke smith is retarded and has horrible taste in license 


# Misc

## tps
Wrapper for xinput to change trackpad settings faster, would be pretty easy to change into a wrapper for any other device

## cpfp
Little script to copy a file's path
### Requires:
	* xclip

## underscored
A little script I stole from stack exchange or something and tweeked a bit, replaces spaces with underscores. Its amazing, so I have to put it here but i don't clam it as entirely mine but its so short I don't think it really matters just use it and be wowed.
### Usage
	-R targets all files and folders recursivly (might need to run a few times to catch all of em, is a little hacky)

## rot
Easily rotate screen from the cmdline using xrander.
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
Bootstrapping script for writing shell scripts

## rmd
Crappy wrapper for rm and rmdir, I don't even use, keep it for nostalgia, maybe I'll fix it one day

## se 
Scrip I stole from a Luke Smith vid and modified, so probably maybe might use a different license, I don't know or care, it's a wrapper for fzf. I would die without this on my computer.

## tts
Scrip I use to get tts honestly only reason it's a thing is so, I don't have to recompile dwm if I want to tweak my tts.

## tts2
Wrapper to fix svox arch package is its broken and I don't know enough python to patch it. Someone should though.
