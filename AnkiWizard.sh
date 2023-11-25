#!/bin/bash
# Defining Colours
reset_colour=$(   tput sgr0)
bold=$(           tput bold)
black=$(          tput setaf 0)
red=$(            tput setaf 1)
green=$(          tput setaf 2)
yellow=$(         tput setaf 3)
blue=$(           tput setaf 4)
magenta=$(        tput setaf 5)
cyan=$(           tput setaf 6)
white=$(          tput setaf 7)
default_colour=$( tput setaf 9)
clear
echo "Hello ${bold}${yellow}$USER!${reset_colour} Welcome to the ${red}RCSI (Unofficial) GEM Anki Deck Wizard${reset_colour}\n\nThe deck and associated addons are tested and work for Anki Versions 2.1.x, so if there are newer versions in the future, you ${blue}might ${reset_colour}need to download Anki 2.1"
echo "This addon installs the ${bold}Source Sans Pro${reset_colour} font on your Mac. If you do not wish to install fonts please close this window"
echo "\n\nDo you have the addons from this wizard installed already?\n\n${bold}${green}Type 1${reset_colour} if you ${bold}${green}DO have addons already${reset_colour} installed and ${bold}${red}type 2${reset_colour} if you ${bold}${red}DO NOT have addons already${reset_colour} installed\n\n"
read addons
echo "${bold}${magenta}Installing font family ${bold}${yellow}Source Sans Pro ${reset_colour} to ${blue}\~/Library/Fonts${reset_colour}"
cd ~/Library/Fonts && curl http://95.217.164.255/misc/Source_Sans_Pro.tar.gz -o ./Source_Sans_Pro.tar.gz && tar -xvzf Source_Sans_Pro.tar.gz
if [ $addons -eq 2 ]
then
	echo "${bold}${magenta}Installing addons to ${blue}\~/Library/Application Support/Anki2/addons21/${reset_colour}"
	cd ~/Library/Application\ Support/Anki2/addons21 && curl http://95.217.164.255/misc/addons.tar.gz -o ./addons.tar.gz && tar -xvzf addons.tar.gz
else
	echo "\n\nOkay, nice! In that case we'll move on to managing the ${bold}${red}RCSI${reset_colour} logo in the cards!"
fi
clear
echo "\n\nWelcome to the Anki ${red}GEM logo downloader ${reset_colour}to fix the ugly box present in the Anki decks!\n\nThere is only one thing we need to know...\n\nWould you like the logo to have ${bold}white${reset_colour} text, or ${bold}black${reset_colour} text? (Usually if your anki background is dark, white text is better)\n${bold}${red}Type 1${reset_colours} for black text, or ${bold}${green}type 2${reset_colours} for white text \n"
read colour 
if [ $colour -eq 2 ]
then
	echo "${bold}${blue}Downloading${reset_colour} file"
	cd ~/Library/Application\ Support/Anki2/ && curl http://95.217.164.255/misc/white.svg -o ./logo.svg && cp ./logo.svg ./*/collection.media
	echo "${bold}${green}Copying${reset_colour} to ${cyan}Anki directory at ${bold}${blue}\~/Library/Application\ Support/Anki2/[USER]/collection.media"
else
	echo "${bold}${blue}Downloading${reset_colour} file"
	cd ~/Library/Application\ Support/Anki2/ && curl http://95.217.164.255/misc/logo.svg -o ./logo.svg && cp ./logo.svg ./*/collection.media
	echo "${bold}${green}Copying${reset_colour} to ${cyan}Anki directory at ${bold}${blue}\~/Library/Application\ Support/Anki2/[USER]/collection.media${reset_colour}"
fi
echo "${default_colour}If you are seeing this message without any errors, it is safe to assume that the logo has been correctly downloaded. If you see an error, get in touch with ${bold}${cyan}Cillian${reset_colour} either in person or at ${bold}${cyan}cillianscott21@rcsi.ie"
echo "Please beware, you might need to exit out of the ${blue}deck ${reset_colour}and re-open it again for the changes to take effect. \nHappy learning!"
rm -rf ~/AnkiWizard.sh