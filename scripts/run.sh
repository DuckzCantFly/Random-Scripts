#! /bin/sh
# a little script to try to fix rpgmaker games

# Set the game directory
set_game_directory() {
	if [ -z "$1" ]; then
		echo "$(echo "$0" | rev | cut -d '/' -f 2- | rev)"
	else
		echo "$1"
	fi
}

# Make sure the "nw" file is executable
make_nw_executable() {
	[ -x "$1/nw" ] && chmod +x "$1/nw"
}

find_perfered_version() {
	# local latest_tag=$(curl -s https://api.github.com/repos/nwjs/nw.js/tags | jq -r '.[0].name')
	local latest_tag=$(curl -s https://api.github.com/repos/nwjs/nw.js/tags | grep "name" | cut -d '"' -f 4 | head -n 1)
	local latest_version=$(echo "$latest_tag" | cut -d 'v' -f 2)
	if [ -f "$1/package.json" ]; then
		# Extract the preferred version of NW.js from the "package.json" file
		echo $(cat "$1/package.json" | grep "nwjs-sdk-v" | cut -d '"' -f 4 | cut -d '-' -f 3)
	else
		# Use the latest version of NW.js if no "package.json" file is found
		echo $latest_version
	fi

}
# Download the preferred version of NW.js
download_nwjs() {
	if [ ! -f "$1/nwjs-$2-linux-x64/nw" ]; then
		mkdir "$1/nwjs-$2-linux-x64"
		curl -L "https://github.com/nwjs/nw.js/releases/tag/$2"\
			| tar xz -C "$1/nwjs-$2-linux-x64"
	fi
	# Set the path to the NW.js runtime
	echo "$1/nwjs-$2-linux-x64/nw"
}

# Generate the font configuration file
generate_font_config() {
	if [ ! -d "$1/fonts" ]; then
		# Create the font configuration directory
		mkdir "$1/fonts"
	fi

	# Check if the fontconfig library is installed and available
	if ldconfig -p | grep -q libfontconfig.so; then
		# Check if the /usr/share/fonts directory exists and is readable
		if [ -d "/usr/share/fonts" ] && [ -r "/usr/share/fonts" ]; then
			# Generate the font configuration file using the /usr/share/fonts directory
			mkfontdir /usr/share/fonts > "$1/fonts/fonts.conf"
		else
			# Use a hard-coded fallback directory if /usr/share/fonts is not available
			echo '<fontconfig><dir>/usr/share/fonts</dir><cachedir>fonts</cachedir><match target="font"><edit name="antialias" mode="assign"><bool>true</bool></edit><edit name="hinting" mode="assign"><bool>true</bool></edit><edit name="hintstyle" mode="assign"><const>hintslight</const></edit><edit name="rgba" mode="assign"><const>rgb</const></edit><edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit></match></fontconfig>' > "$1/fonts
/fonts.conf"
		fi
	else
	# Display an error message if the fontconfig library is not available
	echo "Error: the fontconfig library is not installed or not available on the system"
	echo "Please make sure that the fontconfig library is installed and available before running this script"
	exit 1
fi
}

# Run the game with the specified font configuration
run_game() {
	FONTCONFIG_PATH="$1/fonts" 
	"$2"
}

# Main function
main() {
	local game_directory=$(set_game_directory "$1")
	make_nw_executable "$game_directory"
	local preferred_version=$(find_perfered_version "$game_directory")
	local nwjs_bin=$(download_nwjs "$game_directory" "$preferred_version")
	generate_font_config "$game_directory"
	run_game "$game_directory" "$nwjs_bin"
}

# Call the main function
main "$1"
