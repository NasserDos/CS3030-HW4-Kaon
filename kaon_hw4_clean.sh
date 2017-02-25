#!/bin/bash - 
#===============================================================================
#
#          FILE: kaon_hw4_clean.sh
# 
#         USAGE: ./kaon_hw4_clean.sh 
# 
#   DESCRIPTION: Cleans up the mess.
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#       AUTHORS: Jeremy Johnson, jeremyjohnson7@mail.weber.edu
#                Nasser Binshabeeb, nasserbinshabeeb@mail.weber.edu
#                Trevor Orgill, __USERNAME__@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 02/23/2017 11:00
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error


usage(){
	echo "Usage $0"
	echo "Cleans up the mess"
	exit 1
}

if [[ $1 == "--help" ]]
then
	usage
fi

if [[ -d "temp" ]]
then
	rm -drf temp
fi
if [[ -e "MOCK_DATA_2016.tar.gz" ]]
then
	rm MOCK_DATA_2016.tar.gz
	echo removed MOCK_DATA_2016.tar.gz
fi
if [[ -e "MOCK_DATA_2015.tar.gz" ]]
then
	rm MOCK_DATA_2015.tar.gz
	echo removed MOCK_DATA_2015.tar.gz
fi

	echo Cleanup Complete

exit 0

