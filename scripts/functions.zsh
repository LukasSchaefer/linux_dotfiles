# Web function to open Websites
web(){
	if [ "$1" = "reddit" ]; then
		if [ "$2" = "headphones" ]; then
			open 'http://www.reddit.com/r/headphones/'
			return
		fi
		if [ "$2" = "headphone" ]; then
			open 'http://www.reddit.com/r/headphones/'
			return
		fi
		if [ "$2" = "lol" ]; then
			open 'http://www.reddit.com/r/leagueoflegends/'
			return
		fi
		if [ "$2" = "csgo" ]; then
			open 'http://www.reddit.com/r/globaloffensive/'
			return
		fi
		if [ "$2" = "mechanicalkeyboards" ]; then
			open 'http://www.reddit.com/r/mechanicalkeyboards/'
			return
		fi
		if [ "$2" = "mechs" ]; then
			open 'http://www.reddit.com/r/mechanicalkeyboards/'
			return
		fi
		if [ "$2" = "keyboard" ]; then
			open 'http://www.reddit.com/r/mechanicalkeyboards/'
			return
		fi
		if [ "$2" = "keyboards" ]; then
			open 'http://www.reddit.com/r/mechanicalkeyboards/'
			return
		fi
		open 'http://www.reddit.com/r/Dashboard/'
		return
	fi

	if [[ "$1" = "youtube" || "$1" = "yt" ]]; then
		if [ "$2" = "watchlater" ]; then
			open 'https://www.youtube.com/playlist?list=WL'
			return
		fi
		if [ "$2" = "wl" ]; then
			open 'https://www.youtube.com/playlist?list=WL'
			return
		fi
		open 'https://www.youtube.com/?gl=DE&hl=de'
		return
	fi

	if [ "$1" = "gh" ] || [ "$1" = "github" ]; then
		open 'https://github.com/LukasStudent'
		return
	fi

    if [ "$1" = "twitch" ]; then
		open 'http://www.twitch.tv'
		return
	fi

	echo "invalid input after function call"
}

ob() {
    if ! [ "$#" -ge 1 ]; then
        echo "ERROR: 'ob <file>' to open file in background"
        return
    fi
    # open in background
    xdg-open "$1" & disown
}
