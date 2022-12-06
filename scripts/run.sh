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

# Find version what of nw to use
find_perfered_version() {
	# Check for the latest tag of NW.js
	local latest_tag=$(curl -s https://api.github.com/repos/nwjs/nw.js/tags | jq -r '.[0].name')

	# Extract the version number from the tag	
	local latest_version=$(echo "$latest_tag" | cut -d 'v' -f 2)

	# Check if the game has a "package.json" file
	if [ -f "$1/package.json" ]; then
		# Extract the preferred version of NW.js from the "package.json" file
		local preferred_version=$(cat "$1/package.json" | grep "nwjs-sdk-v" | cut -d '"' -f 4 | cut -d '-' -f 3)
	
		# Check if the preferred version is valid
		if [ -z "$preferred_version" ] || [ "$preferred_version" -lt "0" ]; then
			# Use the latest version if the preferred version is not found or is not valid
			echo $latest_version
		else
			# Use the preferred version if it is found and valid
			echo $preferred_version
		fi
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

# Make sure the "nw" file is executable
make_nw_executable() {
	[ -x "$1" ] && chmod +x "$1"
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
		# Check if the /usr/share/fonts directory exists and is readable
		if [ -d "/usr/share/fonts" ] && [ -r "/usr/share/fonts" ]; then
			# Use a hard-coded fallback directory if the fontconfig library is not available
			echo '<fontconfig><dir>/usr/share/fonts</dir><cachedir>fonts</cachedir><match target="font"><edit name="antialias" mode="assign"><bool>true</bool></edit><edit name="hinting" mode="assign"><bool>true</bool></edit><edit name="hintstyle" mode="assign"><const>hintslight</const></edit><edit name="rgba" mode="assign"><const>rgb</const></edit><edit name="lcdfilter" mode="assign"><const>lcddefault</const></edit></match></fontconfig>' > "$1/fonts
			/fonts.conf"
		else
			# Display an error message if the /usr/share/fonts directory is not available
			echo "Error: the /usr/share/fonts directory does not exist or is not readable"
			echo "Please make sure that the /usr/share/fonts directory exists and is readable before running this script"
			exit 1
		fi
	fi
}


# Run the game with the specified font configuration
run_game() {
	FONTCONFIG_PATH="$1/fonts" 
	"$2"
}

# Main function
main() {
	# Set $game_directory to proper location
	local game_directory=$(set_game_directory "$1")
	# Find the proper version for game
	local preferred_version=$(find_perfered_version "$game_directory")
	# Download new proper verserion of nw.js
	local nwjs_bin=$(download_nwjs "$game_directory" "$preferred_version")
	# Make sure nw is can be exuted
	make_nw_executable "$game_directory"
	# Set up font config
	generate_font_config "$nwjs_bin"
	# Run the game
	run_game "$game_directory" "$nwjs_bin"
}

# Call the main function
main "$1"
