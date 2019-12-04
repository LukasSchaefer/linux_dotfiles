#!/bin/zsh

source ~/.scripts/functions.zsh

# Script to start various twitch streams with the help of livestream and a select/case implementation
# while listing the alias for all the streams 

selectstreams(){

# First we can select different groups of streams divided into games finished off by the option to
# show all streams or alternatively quit the script

select STREAM in quit lol dota cs other all
do
	# now the different cases with the categories from above are executed. While quit is fairly simple
	# the other cases first print the multiple streams of this category (or all in the case of the all
	# option) with its alias and then they give the option to start the streams with the help of
	# another case function again with the option to quit.

	case "$STREAM" in 
		
		quit)
			return
			;;
	
		lol) 
			print "0) quit"
			print "1) Riotgames: riot, Riotgames"
			print "2) SummonersInnLive: gerlcs, summonersinnlive"
			print "3) esl_summonersinn: maxim, suminn"
            print "4) kev1ntv: kevin"
            print "5) HandofBlood: hob, HandofBlood"
			print "6) esl_lol: esllol, lolesl, esl_lol"
			print "7) Nightblue3: nb3, nightblue, nightblue3"
            print "8) imaqtpie: qtpie"
			print "9) SirhcEz: sirhcez, sirhcEz"
			print "10) PhreakStream: phreakstream, phreak"
			print "11) Cyanide: cyanide"
			print "12) Trick2g: trick, trick2g"
            print "13) C9Sneaky: c9sneaky, sneaky"
			print "14) Meteos: meteos"
			print "15) TSM_Bjergsen: bjerg, bjergsen"
			print "16) Zionspartan: zion, zionspartan"
			
			read WISH			

			case "$WISH" in

				0) return ;;
				1) livestream Riotgames 
					return
					;;
				2) livestream SummonersInnLive
					return
					;;
				3) livestream esl_summonersinn
					return
					;;
                4) livestream kev1ntv
                    return
                    ;;
                5) livestream HandIOfIBlood
                    return
                    ;;
				6) livestream esl_lol
					return
					;;
				7) livestream Nightblue3
					return
					;;
                8) livestream imaqtpie
                    return
                    ;;
				9) livestream SirhcEz
					return
					;;
				10) livestream PhreakStream
					return	
					;;
				11) livestream Cyanide
					return	
					;;
				12) livestream Trick2g
					return
					;;
                13) livestream c9sneaky
                    return
                    ;;
				14) livestream Meteos
					return
					;;
				15) livestream TSM_Bjergsen
					return
					;;
				16) livestream Zionspartan
					return
					;;
				*) echo "invalid argument!"
				   return
				   ;;

			esac

		;;

		dota)
			print "0) quit"
			print "1) dota2ti: ti, dota2ti"
			print "2) dota2ti_newcomer: dota2newcomer, dota2tinewcomer, dota2ti_newcomer"
            print "3) dotamajor: dotamajor"

			read WISH

			case "$WISH" in

				0) return ;;
				1) livestream dota2ti
					return
					;;
				2) livestream dota2ti_newcomer
					return
					;;
                3) livestream dotamajor
                    return
                    ;;
				*) echo "invalid argument!"
				   return
				   ;;

			esac

			;;

		cs)
			print "0) quit"
			print "1) esl_csgo: csesl, eslcs, esl_csgo"
			print "2) FragbiteLive: fragbite, fragbitelive"
			print "3) FACEITTV: face, faceit, faceittv"
			print "4) Summit1g: summit, summit1g"

			read WISH

			case "$WISH" in

				0) return ;;
				1) livestream esl_csgo
					return
					;;
				2) livestream FragbiteLive
					return
					;;
				3) livestream FACEITTV
					return
					;;
				4) livestream Summit1g
					return
					;;
				*) echo "invalid argument!"
				   return
				   ;;

			esac

			;;

		other)
			print "0) quit"
			print "1) Kyleandrypiano: kyle, kylean, kyleandry, kyleandrypiano, kylepiano"
			print "2) Sodapoppin: soda, sodapoppin"
			print "3) GamesDoneQuick: gdq, gamesdonequick"
			print "4) Pewdiepie: pew, pewdiepie"

			read WISH

			case "$WISH" in

				0) return ;;
				1) livestream Kyleandrypiano
					return
					;;
				2) livestream Sodapoppin
					return
					;;
				3) livestream GamesDoneQuick
					return
					;;			
				4) livestream Pewdiepie
					return
					;;
				*) echo "invalid argument!"
				   return
				   ;;

			esac

			;;

		

		all)
			print "0) quit"
			print "1) Riotgames: riot, Riotgames"
			print "2) SummonersInnLive: gerlcs, summonersinnlive"
			print "3) esl_summonersinn: maxim, suminn"
            print "4) kev1ntv: kevin"
            print "5) HandofBlood: hob, HandofBlood"
			print "6) esl_lol: esllol, lolesl, esl_lol"
			print "7) Nightblue3: nb3, nightblue, nightblue3"
            print "8) imaqtpie: qtpie"
			print "9) SirhcEz: sirhcez, sirhcEz"
			print "10) PhreakStream: phreakstream, phreak"
			print "11) Cyanide: cyanide"
			print "12) Trick2g: trick, trick2g"
            print "13) C9Sneaky: c9sneaky, sneaky"
			print "14) Meteos: meteos"
			print "15) TSM_Bjergsen: bjerg, bjergsen"
			print "16) Zionspartan: zion, zionspartan"
			print "17) dota2ti: ti, dota2ti"
			print "18) dota2ti_newcomer: dota2newcomer, dota2tinewcomer, dota2ti_newcomer"
            print "19) dotamajor: dotamajor"
			print "20) esl_csgo: csesl, eslcs, esl_csgo"
			print "21) FragbiteLive: fragbite, fragbitelive"
			print "22) FACEITTV: face, faceit, faceittv"
			print "23) Summit1g: summit, summit1g"
			print "24) Kyleandrypiano: kyle, kylean, kyleandry, kyleandrypiano, kylepiano"
			print "25) Sodapoppin: soda, sodapoppin"
			print "26) GamesDoneQuick: gdq, gamesdonequick"
			print "27) Pewdiepie: pew, pewdiepie"
			

			read WISH

			case "$WISH" in

				0) return ;;
				1) livestream Riotgames 
					return
					;;
				2) livestream SummonersInnLive
					return
					;;
				3) livestream esl_summonersinn
					return
					;;
                4) livestream kev1ntv
                    return
                    ;;
                5) livestream HandIOfIBlood
                    return
                    ;;
				6) livestream esl_lol
					return
					;;
				7) livestream Nightblue3
					return
					;;
                8) livestream imaqtpie
                    return
                    ;;
				9) livestream SirhcEz
					return
					;;
				10) livestream PhreakStream
					return	
					;;
				11) livestream Cyanide
					return	
					;;
				12) livestream Trick2g
					return
					;;
                13) livestream c9sneaky
                    return
                    ;;
				14) livestream Meteos
					return
					;;
				15) livestream TSM_Bjergsen
					return
					;;
				16) livestream Zionspartan
					return
					;;
				17) livestream dota2ti
					return
					;;
				18) livestream dota2ti_newcomer
					return
					;;
                19) livestream dotamajor
                    return
                    ;;
				20) livestream esl_csgo
					return
					;;
				21) livestream FragbiteLive
					return
					;;
				22) livestream FACEITTV
					return
					;;
				23) livestream Summit1g
					return
					;;
				24) livestream Kyleandrypiano
					return
					;;
				25) livestream Sodapoppin
					return
					;;
				26) livestream GamesDoneQuick
					return
					;;
				27) livestream Pewdiepie
					return
					;;
				*) echo "invalid argument!"
				   return
				   ;;

			esac
				
			;;

		# Short error message in case of an invalid argument
		*)
			echo "invalid argument!"
			return
			;;

	esac

done

}
