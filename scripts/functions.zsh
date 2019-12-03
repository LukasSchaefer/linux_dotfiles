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

    if [ "$1" = "proxer" ]; then
        open 'http://proxer.me/anime/animeseries/rating/all#top'
        return
    fi

    if [ "$1" = "alluc" ]; then
        open 'http://www.alluc.ee'
        return
    fi

# _____________________________________________________________________________________________
	if [ "$1" = "prog" ] || [ "$1" = "prog2" ]; then
        open 'https://prog2.cs.uni-saarland.de/ss16/'
        return
	fi

	if [ "$1" = "mfi2" ]; then
        open 'https://www.mpi-inf.mpg.de/de/departments/algorithms-complexity/teaching/summer16/mathematik-fuer-informatiker-2/'
        return
	fi

    if [ "$1" = "sysarch" ]; then
        open 'https://sysarch.cdl.uni-saarland.de/ss16/'
        return
    fi

    if [ "$1" = "ai" ]; then
        if [ "$2" = "moodle" ]; then
			open 'https://fai-lecture.cs.uni-saarland.de/login/index.php'
			return
		fi
        open 'http://fai.cs.uni-saarland.de/teaching/summer-17/ai.html'
        return
    fi

    if [ "$1" = "infosys" ]; then
        if [ "$2" = "moodle" ]; then
			open 'https://islecture.cs.uni-saarland.de/login/index.php'
			return
		fi
        open 'https://infosys.cs.uni-saarland.de/teaching/ss17/infosys.php'
        return
    fi

    if [ "$1" = "esem" ]; then
        open 'http://esem.bsz-bw.de/sulb/'
        return
    fi

    if [ "$1" = "mipl" ]; then
        open 'http://compilers.cs.uni-saarland.de/teaching/seminar/mipl/2017/index.php'
        return
    fi

    if [ "$1" = "np" ]; then
        open 'https://dcms.cs.uni-saarland.de/np_17/'
        return
    fi

    if [ "$1" = "se" ]; then
        open 'https://www.st.cs.uni-saarland.de/edu/se/2017/index.php'
        return
    fi

    if [ "$1" = "nn" ]; then
        if [ "$2" = "book" ]; then
			open 'http://www.deeplearningbook.org/'
			return
		fi
        open 'https://www.lsv.uni-saarland.de/index.php?id=174'
        return
    fi

    if [ "$1" = "irdm" ]; then
        open 'https://www.mpi-inf.mpg.de/departments/databases-and-information-systems/teaching/winter-semester-201718/information-retrieval-and-data-mining/'
        return
    fi

    if [ "$1" = "ap" ] || [ "$1" = "planning" ]; then
        if [ "$2" = "moodle" ]; then
			open 'https://fai-lecture.cs.uni-saarland.de/login/index.php'
			return
		fi
        open 'http://fai.cs.uni-saarland.de/teaching/winter17-18/planning.html'
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

# function to start livestreamer with twitch source
livestream(){
    osascript <<-EOF
    tell application "iTerm"
    create window with profile "ZSH_livestream"
    select first window
    launch session "Default Session"
        tell current session of first window
            write text "livestreamer twitch.tv/'$1' best; exit"
        end tell
    end tell
EOF
}

pdfmerge() {
    if ! [ "$#" -ge 3 ]; then
        echo "ERROR: The script needs at least 3 arguments: <output.pdf> <input1.pdf> <input2.pdf> <...>"
        return
    fi

    for i in "${@:2}"; do
        # all input files have to exist and be a valid PDF file
        if ! [ -f "$i" ]; then
            echo "ERROR: All input arguments have be already existing pdf files!"
            echo "Input file $i does not exist"
            return
        fi

        if ! [ $(head -c 4 "$i") = "%PDF" ]; then
            echo "ERROR: The input file $i is not a valid PDF file!"
            return
        fi
    done

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=$1 ${@:2}
    echo "Merge successfull!"
    return
}

compresspdf() {
    if ! [ "$#" -ge 2 ]; then
        echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
        return
    fi

    if [ "$#" -ge 4 ]; then
        echo 'Usage: compresspdf [input file] [output file] [screen|ebook|printer|prepress]'
        return
    fi

    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}
