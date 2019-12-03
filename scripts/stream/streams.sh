#!/bin/zsh

# Script to print all the alias' of various created livestream streams divided into multiple 
# categories with the option to start the wished stream afterwards.
streams(){

if [ "$1" = "lol" ]
	then 
	print "Riotgames: riot, Riotgames"
	print "SummonersInnLive: gerlcs, summonersinnlive"
	print "esl_summonersinn: maxim, suminn"
	print "esl_lol: esllol, lolesl, esl_lol"
    print "kev1ntv: kevin"
    print "HandofBlood: hob, HandofBlood"
	print "Nightblue3: nb3, nightblue, nightblue3"
    print "imaqtpie: qtpie"
    print "C9Sneaky: sneaky, c9sneaky"
	print "Meteos: meteos"
	print "SirhcEz: sirhcez, sirhcEz"
	print "PhreakStream: phreakstream, phreak"
	print "Cyanide: cyanide"
	print "Trick2g: trick, trick2g"
	print "TSM_Bjergsen: bjerg, bjergsen"
	print "Zionspartan: zion, zionspartan"

elif [ "$1" = "cs" ]
	then
	print "esl_csgo: csesl, eslcs, esl_csgo"
	print "FragbiteLive: fragbite, fragbitelive"
	print "FACEITTV: face, faceit, faceittv"
	print "Summit1g: summit, summit1g"

elif [ "$1" = "other" ]
	then
	print "Kyleandrypiano: kyle, kylean, kyleandry, kyleandrypiano, kylepiano"
	print "Sodapoppin: soda, sodapoppin"
	print "GamesDoneQuick: gdq, gamesdonequick"
	print "Pewdiepie: pew, pewdiepie"

elif [ "$1" = "dota" ]
	then
	print "dota2ti: ti, dota2ti"
	print "dota2ti_newcomer: dota2newcomer, dota2tinewcomer, dota2ti_newcomer"
    print "dotamajor: dotamajor"

else
	print "Riotgames: riot, Riotgames"
	print "SummonersInnLive: gerlcs, summonersinnlive"
	print "esl_summonersinn: maxim, suminn"
	print "esl_lol: esllol, lolesl, esl_lol"
    print "kev1ntv: kevin"
    print "HandofBlood: hob, HandofBlood"
	print "Nightblue3: nb3, nightblue, nightblue3"
    print "imaqtpie: qtpie"
    print "C9Sneaky: sneaky, c9sneaky"
	print "Meteos: meteos"
	print "SirhcEz: sirhcez, sirhcEz"
	print "PhreakStream: phreakstream, phreak"
	print "Cyanide: cyanide"
	print "Trick2g: trick, trick2g"
	print "TSM_Bjergsen: bjerg, bjergsen"
	print "Zionspartan: zion, zionspartan"
	print "esl_csgo: csesl, eslcs, esl_csgo"
	print "FragbiteLive: fragbite, fragbitelive"
	print "FACEITTV: face, faceit, faceittv"
	print "Summit1g: summit, summit1g"
	print "Kyleandrypiano: kyle, kylean, kyleandry, kyleandrypiano, kylepiano"
	print "Sodapoppin: soda, sodapoppin"
	print "GamesDoneQuick: gdq, gamesdonequick"
	print "Pewdiepie: pew, pewdiepie"
	print "dota2ti: ti, dota2ti"
	print "dota2ti_newcomer: dota2newcomer, dota2tinewcomer, dota2ti_newcomer"
    print "dotamajor: dotamajor"
fi

read WISH

if [ $WISH = "quit" ]
	then
	return

elif [ $WISH = "riot" ] 
	then
	livestream Riotgames
	return

elif [ $WISH = "Riotgames" ]
	then
	livestream Riotgames
	return

elif [ $WISH = "gerlcs" ]
	then
	livestream SummonersInnLive
	return

elif [ $WISH = "summonersinnlive" ]
	then
	livestream SummonersInnLive
	return

elif [ $WISH = "maxim" ]
	then
	livestream esl_summonersinn
	return

elif [ $WISH = "kevin" ]
    then
    livestream kev1ntv
    return

elif [ $WISH = "hob" ]
    then
    livestream HandIOfIBlood
    return

elif [ $WISH = "HandofBlood" ]
    then
    livestream HandIOfIBlood
    return

elif [ $WISH = "esllol" ]
	then
	livestream esl_lol
	return

elif [ $WISH = "lolesl" ]
	then
	livestream esl_lol
	return

elif [ $WISH = "esl_lol" ] 
	then
	livestream esl_lol
	return

elif [ $WISH = "nb3" ]
	then
	livestream Nightblue3
	return

elif [ $WISH = "nightblue" ]
	then
	livestream Nightblue3
	return

elif [ $WISH = "nightblue3" ]
	then
	livestream Nightblue3
	return

elif [ $WISH = "qtpie" ]
    then
    livestream imaqtpie
    return

elif [ $WISH = "sirhcez" ]
	then
	livestream SirhcEz
	return

elif [ $WISH = "SirhcEz" ]
	then
	livestream SirhcEz
	return

elif [ $WISH = "phreak" ]
	then
	livestream PhreakStream
	return

elif [ $WISH = "phreakstream" ]
	then 
	livestream PhreakStream
	return

elif [ $WISH = "phreak" ]
	then
	livestream PhreakStream
	return

elif [ $WISH = "cyanide" ]
	then
	livestream Cyanide
	return

elif [ $WISH = "trick" ]
	then
	livestream Trick2g 
	return

elif [ $WISH = "trick2g" ]
	then
	livestream Trick2g 
	return

elif [ $WISH = "meteos" ]
	then
	livestream Meteos 
	return

elif [ $WISH = "sneaky" ]
    then
    livestream c9sneaky
    return

elif [ $WISH = "c9sneaky" ]
    then
    livestream c9sneaky
    return

elif [ $WISH = "bjergsen" ]
	then
	livestream TSM_Bjergsen 
	return

elif [ $WISH = "bjerg" ]
	then
	livestream TSM_Bjergsen 
	return

elif [ $WISH = "zion" ]
	then
	livestream Zionspartan 
	return

elif [ $WISH = "zionspartan" ]
	then
	livestream Zionspartan
	return

elif [ $WISH = "csesl" ]
	then
	livestream esl_csgo 
	return
 
elif [ $WISH = "eslcs" ]
	then
	livestream esl_csgo 
	return

elif [ $WISH = "esl_csgo" ] 
	then
	livestream esl_csgo 
	return

elif [ $WISH = "fragbite" ]
	then
	livestream FragbiteLive 
	return

elif [ $WISH = "fragbitelive" ]
	then
	livestream FragbiteLive 
	return

elif [ $WISH = "face" ] 
	then
	livestream FACEITTV 
	return

elif [ $WISH = "faceit" ]
	then
	livestream FACEITTV 
	return

elif [ $WISH = "faceittv" ]
	then
	livestream FACEITTV 
	return

elif [ $WISH = "summit" ]
	then
	livestream Summit1g 
	return

elif [ $WISH = "summit1g" ]
	then
	livestream Summit1g 
	return

elif [ $WISH = "kyle" ]
	then
	livestream Kyleandrypiano 
	return

elif [ $WISH = "kylean" ]
	then
	livestream Kyleandrypiano 
	return
 
elif [ $WISH = "kyleandry" ]
	then
	livestream Kyleandrypiano 
	return

elif [ $WISH = "kyleandrypiano" ]
	then
	livestream Kyleandrypiano 
	return

elif [ $WISH = "kylepiano" ] 
	then
	livestream Kyleandrypiano 
	return

elif [ $WISH = "soda" ]
	then
	livestream Sodapoppin 
	return

elif [ $WISH = "sodapoppin" ]
	then
	livestream Sodapoppin
	return

elif [ $WISH = "gdq" ]
    then
    livestream GamesDoneqQuick
    return

elif [ $WISH = "gamesdonequick" ]
    then
    livestream GamesDoneQuick
    return

elif [ $WISH = "pew" ]
    then
    livestream Pewdiepie
    return

elif [ $WISH = "pewdiepie" ]
    then
    livestream Pewdiepie
    return     

elif [ $WISH = "ti" ]
    then
    livestream dota2ti
    return

elif [ $WISH = "dota2ti" ]
    then
    livestream dota2ti
    return

elif [ $WISH = "dota2newcomer" ]
    then
    livestream dota2ti_newcomer
    return

elif [ $WISH = "dota2tinewcomer" ]
    then
    livestream dota2ti_newcomer
    return

elif [ $WISH = "dota2ti_newcomer" ]
    then
    livestream dota2ti_newcomer
    return

elif [ $WISH = "dotamajor" ]
    then
    livestream dotamajor
    return

else echo "Wrong shortcut! Compare with the output above."
	return

fi 

}
